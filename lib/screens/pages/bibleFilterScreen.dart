import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/models/bibleApiResponse.dart';
import 'package:churchapp_flutter/models/models/country_data.dart';
import 'package:churchapp_flutter/models/models/language.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/screens/provider/pagination_ptovider.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class BibleFilterScreen extends StatefulWidget {
  BibleFilterScreen({Key? key}) : super(key: key);
  static const routeName = "/BibleFilterScreen";

  @override
  _BibleFilterScreenState createState() => _BibleFilterScreenState();
}

class _BibleFilterScreenState extends State<BibleFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return BibleFilterScreenItem();
  }
}

class BibleFilterScreenItem extends StatefulWidget {
  const BibleFilterScreenItem({super.key});

  @override
  State<BibleFilterScreenItem> createState() => _BibleFilterScreenItemState();
}

class _BibleFilterScreenItemState extends State<BibleFilterScreenItem> {
  static const String BIBLES_ENDPOINT =
      'https://4.dbt.io/api/bibles?language_code=ENG&v=4';
  static const String LANGUAGES_ENDPOINT = 'https://4.dbt.io/api/languages?v=4';
  static const String COUNTRIES_ENDPOINT = 'https://4.dbt.io/api/countries?v=4';

  late PaginationProvider<BibleData> biblesProvider;
  late PaginationProvider<Language> languagesProvider;
  // late PaginationProvider<Country> countriesProvider;

  String selectedFilter = 'Bibles';
  ValueNotifier<BibleData?> selectedBibleItem = ValueNotifier<BibleData?>(null);
  // ValueNotifier<Country?> selectedCountryItem = ValueNotifier<Country?>(null);
  ValueNotifier<Language?> selectedLanguageItem =
      ValueNotifier<Language?>(null);

  @override
  void initState() {
    super.initState();
    biblesProvider = PaginationProvider<BibleData>(
      endpoint: BIBLES_ENDPOINT,
      fromJson: (json) {
        return BibleData.fromJson(json);
      },
      apiKey: BIBLE_API_KEY,
    );
    languagesProvider = PaginationProvider<Language>(
      endpoint: LANGUAGES_ENDPOINT,
      fromJson: (json) => Language.fromJson(json),
      apiKey: BIBLE_API_KEY,
    );
  }

  @override
  void dispose() {
    biblesProvider.dispose();
    languagesProvider.dispose();
    super.dispose();
  }

  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
      selectedBibleItem.value = null;
      selectedLanguageItem.value = null;
      if (selectedFilter == 'Bibles') {
        biblesProvider.pagingController.refresh();
      } else {
        languagesProvider.pagingController.refresh();
      }
    });
  }

  // void onItemSelected(dynamic item) {
  //   selectedItem.value = item;

  //   final filterProvider =
  //       Provider.of<BibleFilterProvider>(context, listen: false);
  //   if (selectedFilter == 'Bibles') {
  //     filterProvider.setSelectedBible(item['abbr']);
  //   } else if (selectedFilter == 'Languages') {
  //     filterProvider.setSelectedLanguage(item.id.toString());
  //   } else {
  //     filterProvider.setSelectedCountry(item.codes.isoA2.toString());
  //   }
  // }

  void onLangeageItemSelected(Language item) {
    selectedLanguageItem.value = item;
    Provider.of<BibleFilterProvider>(context, listen: false)
        .setSelectedLanguage(item);
  }

  void onBibleItemSelected(BibleData item) {
    selectedBibleItem.value = item;
    Provider.of<BibleFilterProvider>(context, listen: false)
        .setSelectedBible(item);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text(t.quitapp),
                  content: Text(t.quitappaudiowarning),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(t.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<AudioPlayerModel>(context, listen: false)
                            .cleanUpResources();
                        Navigator.of(context).pop(true);
                      },
                      child: Text(t.ok),
                    ),
                  ],
                ),
              )) ??
              false;
        }
        return true;
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.81,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    ChoiceChip(
                      label: Text('Bibles'),
                      selected: selectedFilter == 'Bibles',
                      onSelected: (selected) => onFilterSelected('Bibles'),
                    ),
                    ChoiceChip(
                      label: Text('Languages'),
                      selected: selectedFilter == 'Languages',
                      onSelected: (selected) => onFilterSelected('Languages'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildContent(),
              ),
              // ValueListenableBuilder(
              //   valueListenable: selectedItem,
              //   builder: (context, value, child) {
              //     if (value != null) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Text('Selected: ${_getSelectedItemDisplayName()}'),
              //       );
              //     }
              //     return Container();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  String _getSelectedItemDisplayName() {
    if (selectedFilter == 'Bibles' && selectedBibleItem.value != null) {
      return selectedBibleItem.value!.name;
    } else {
      return selectedLanguageItem.value?.name ?? '';
    }
  }

  Widget _buildContent() {
    if (selectedFilter == 'Bibles') {
      return _buildBiblesContent();
    } else {
      return _buildLanguagesContent();
    }
  }

  Widget _buildBiblesContent() {
    return PagedListView<int, BibleData>(
      pagingController: biblesProvider.pagingController,
      builderDelegate: PagedChildBuilderDelegate<BibleData>(
        itemBuilder: (context, item, index) {
          return ValueListenableBuilder(
            valueListenable: selectedBibleItem,
            builder: (context, value, child) {
              return ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: value == item
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      item.abbr.toString().substring(3, 6),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Language: ${item.language}'),
                selected: value == item,
                onTap: () {
                  onBibleItemSelected(item);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLanguagesContent() {
    return PagedListView<int, Language>(
      pagingController: languagesProvider.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Language>(
        itemBuilder: (context, language, index) {
          return ValueListenableBuilder(
            valueListenable: selectedLanguageItem,
            builder: (context, value, child) {
              return ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: value == language
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.record_voice_over,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                title: Text(
                  language.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    'Bibles: ${language.bibles}, Filesets: ${language.filesets}'),
                selected: value == language,
                onTap: () => onLangeageItemSelected(language),
              );
            },
          );
        },
      ),
    );
  }
}
