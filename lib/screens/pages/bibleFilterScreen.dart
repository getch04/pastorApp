import 'dart:async';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/models/language.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/DrawerScreen.dart';
import 'package:churchapp_flutter/screens/pages/languageDetailScreen.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/screens/provider/pagination_ptovider.dart';
import 'package:churchapp_flutter/utils/img.dart';
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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        drawer: Container(
          padding: EdgeInsets.only(top: statusBarHeight + appBarHeight - 30),
          child: Drawer(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              child: DrawerScreen(),
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  Img.get('new/bg_home.png'),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color.fromARGB(255, 88, 138, 179),
                        Color.fromARGB(255, 160, 209, 224),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            Img.get('new/Logo.png'),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MY VIRTUAL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'PASTOR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(),
                        GestureDetector(
                          onTap: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              Img.get('new/menu.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.82,
                  width: MediaQuery.of(context).size.width,
                  child: BibleFilterScreenItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BibleFilterScreenItem extends StatefulWidget {
  const BibleFilterScreenItem({super.key});

  @override
  State<BibleFilterScreenItem> createState() => _BibleFilterScreenItemState();
}

class _BibleFilterScreenItemState extends State<BibleFilterScreenItem> {
  ValueNotifier<Language?> selectedLanguageItem =
      ValueNotifier<Language?>(null);
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchQuery = _searchController.text;
      });
    });
  }

  void onLanguageItemSelected(Language item) {
    selectedLanguageItem.value = item;
    Provider.of<BibleFilterProvider>(context, listen: false)
        .setSelectedLanguage(item);
    Navigator.pushNamed(context, LanguageDetailScreen.routeName,
        arguments: ScreenArguements(items: item.id));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8.0,
            children: [
              ChoiceChip(
                label: Text(t.languages),
                selected: true,
                onSelected: (_) {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            key: Key('searchBox'),
            controller: _searchController,
            decoration: InputDecoration(
              hintText: t.searchLanguages,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(Icons.search),
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
        Expanded(
          child: _buildLanguagesContent(),
        ),
      ],
    );
  }

  Widget _buildLanguagesContent() {
    final filteredLanguages = languages.where((language) {
      return language.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredLanguages.length,
      itemBuilder: (context, index) {
        final language = filteredLanguages[index];
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
              selected: value == language,
              onTap: () => onLanguageItemSelected(language),
            );
          },
        );
      },
    );
  }
}
