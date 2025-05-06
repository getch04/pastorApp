import 'dart:math';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/providers/CategoriesModel.dart';
import 'package:churchapp_flutter/screens/NoitemScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonPlayerScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

class SermonScreen extends StatefulWidget {
  SermonScreen({Key? key}) : super(key: key);
  static const routeName = "/SermonScreen";

  @override
  _SermonScreenState createState() => _SermonScreenState();
}

class _SermonScreenState extends State<SermonScreen> {
  @override
  Widget build(BuildContext context) {
    return SermonScreenItem();
  }
}

class SermonScreenItem extends StatefulWidget {
  SermonScreenItem({
    Key? key,
  }) : super(key: key);

  @override
  _SermonScreenItemState createState() => _SermonScreenItemState();
}

class _SermonScreenItemState extends State<SermonScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final translator = GoogleTranslator();
  late AppStateManager appManager;

  // Dynamic translation function
  Future<String> translateText(String text) async {
    final translatedText = await translator.translate(text, to: getLang);
    return translatedText.text;
  }

  String get getLang {
    appManager = Provider.of<AppStateManager>(context, listen: false);

    final lang = appLanguageData[
        AppLanguage.values[appManager.preferredLanguage]]!['value']!;
    return lang == "dz" ? 'ne' : lang;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await (showDialog(
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
              ))) ??
              false;
        }
        return true;
        // else {
        //   return (await (showDialog(
        //         context: context,
        //         builder: (context) => CupertinoAlertDialog(
        //           title: Text(t.quitapp),
        //           content: Text(t.quitappwarning),
        //           actions: <Widget>[
        //             ElevatedButton(
        //               onPressed: () => Navigator.of(context).pop(false),
        //               child: Text(t.cancel),
        //             ),
        //             ElevatedButton(
        //               onPressed: () {
        //                 SystemNavigator.pop();
        //               },
        //               child: Text(t.ok),
        //             ),
        //           ],
        //         ),
        //       ))) ??
        //       false;
        // }
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.83,
          width: MediaQuery.of(context).size.width,
          child: ChangeNotifierProvider(
            create: (context) => CategoriesModel(
                Provider.of<AppStateManager>(context, listen: false)),
            child: Column(
              // shrinkWrap: true,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                FutureBuilder<String>(
                    future: translateText('1 Year of Sermons'),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Language Not Supported');
                      }
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data ?? '',
                          style: TextStyles.title(context).copyWith(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
                SermonBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SermonBody extends StatelessWidget {
  const SermonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoriesModel categoriesModel = Provider.of<CategoriesModel>(context);
    List<Categories>? items = categoriesModel.categories;
    if (categoriesModel.isLoading) {
      return Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      ));
    } else if (categoriesModel.isError) {
      return NoitemScreen(
          title: t.oops,
          message: t.dataloaderror,
          onClick: () {
            categoriesModel.loadItems();
          });
    } else
      return Container(
        height: MediaQuery.of(context).size.height * 0.76,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: categoriesModel.categories?.length ?? 0,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final cat = categoriesModel.categories?[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SermonPlayerScreen.routeName,
                    arguments: ScreenArguements(
                      items: cat,
                    ),
                  );
                },
                child: SermonButton(
                  week: index + 1,
                  category: cat,
                ),
              ),
            );
          },
        ),
      );
  }
}

// Global cache for translated strings to avoid retranslating
class _TranslationCache {
  static final Map<String, Map<String, String>> _cache = {};

  static String? get(String text, String langCode) {
    return _cache[text]?[langCode];
  }

  static void set(String text, String langCode, String translated) {
    _cache[text] ??= {};
    _cache[text]![langCode] = translated;
  }
}

class SermonButton extends StatefulWidget {
  final int week;
  final Categories? category;

  SermonButton({required this.week, required this.category});

  @override
  _SermonButtonState createState() => _SermonButtonState();
}

class _SermonButtonState extends State<SermonButton> {
  final translator = GoogleTranslator();
  String? _translatedWeek;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _getTranslatedWeek();
  }

  String get getLang {
    final appManager = Provider.of<AppStateManager>(context, listen: false);

    final lang = appLanguageData[
        AppLanguage.values[appManager.preferredLanguage]]!['value']!;
    return lang == "dz" ? 'ne' : lang;
  }

  // Get the translation, either from cache or from API
  void _getTranslatedWeek() async {
    final langCode = getLang;
    // Check cache first
    final cachedValue = _TranslationCache.get('WEEK', langCode);

    if (cachedValue != null) {
      setState(() {
        _translatedWeek = cachedValue;
        _isLoading = false;
      });
      return;
    }

    // If not in cache, translate
    try {
      final translatedText = await translator.translate('WEEK', to: langCode);
      _TranslationCache.set(
          'WEEK', langCode, translatedText.text); // Save to cache

      if (mounted) {
        setState(() {
          _translatedWeek = translatedText.text;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 92, 164),
                Color(0xff0ebef4),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(3, 3),
                blurRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: Stack(
                    children: [
                      // Show appropriate widget based on loading state
                      if (_isLoading)
                        Positioned(
                          top: 62,
                          left: 30,
                          child: CupertinoActivityIndicator(
                            radius: 8,
                          ),
                        )
                      else if (_hasError)
                        Positioned(
                          top: 62,
                          left: 30,
                          child: Text('Language Not Supported'),
                        )
                      else
                        Positioned(
                          top: 62,
                          left: 30,
                          child: ArcText(
                            radius: 55,
                            text: _translatedWeek ?? 'WEEK',
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            startAngle: -pi / 45,
                            startAngleAlignment: StartAngleAlignment.center,
                            placement: Placement.inside,
                            direction: Direction.clockwise,
                          ),
                        ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Text(
                          '${widget.week}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.category?.title ?? 'UNKNOWN',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 65,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
