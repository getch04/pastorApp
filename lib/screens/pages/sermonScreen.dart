import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/models/SermonMedia.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/providers/CategoriesModel.dart';
import 'package:churchapp_flutter/screens/NoitemScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonPlayerScreen.dart';
import 'package:churchapp_flutter/services/sermon_download_service.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  late CategoriesModel _categoriesModel;

  @override
  void initState() {
    super.initState();
    _categoriesModel =
        CategoriesModel(Provider.of<AppStateManager>(context, listen: false));
  }

  @override
  void dispose() {
    _categoriesModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _categoriesModel,
      child: SermonScreenItem(),
    );
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
  late AppStateManager appManager;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final translator = GoogleTranslator();

  double _downloadProgress = 0.0;
  SermonDownloadService? _downloadService;
  bool _isDownloading = false;

  @override
  void dispose() {
    _downloadService?.cancelDownload();
    super.dispose();
  }

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

  Future<void> _downloadAllSermons(
      BuildContext context, CategoriesModel model) async {
    if (_isDownloading) return;

    final categories = model.categories;
    if (categories == null || categories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.nosermons)),
      );
      return;
    }

    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
    });

    try {
      // Get current language
      final language = appLanguageData[
              AppLanguage.values[appManager.preferredLanguage]]!['value'] ??
          'en';

      // Create SermonMedia objects directly from categories
      List<SermonMedia> allSermons = categories
          .map((category) => SermonMedia(
                id: category.id ?? 0,
                title: category.title,
                description: null, // Will be fetched from API
                category: category.title,
                coverPhoto: category.thumbnailUrl,
                mediaType: 'audio', // Since these are sermons
              ))
          .toList();

      _downloadService = SermonDownloadService(
        sermons: allSermons,
        language: language,
        onProgressUpdate: (status, data) {
          if (!mounted) return;

          switch (status) {
            case SermonDownloadService.DOWNLOAD_PROGRESS:
              setState(() {
                _downloadProgress = data as double;
              });
              break;
            case SermonDownloadService.DOWNLOAD_COMPLETED:
              setState(() {
                _isDownloading = false;
                _downloadProgress = 0.0;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t.sermonsdownloaded)),
              );
              break;
            case SermonDownloadService.DOWNLOAD_ERROR:
              setState(() {
                _isDownloading = false;
                _downloadProgress = 0.0;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(t.sermonsdownloaderror)),
              );
              break;
          }
        },
      );

      // Start download in background
      _downloadService?.startDownload();
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _downloadProgress = 0.0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.sermonsdownloaderror)),
      );
    }
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
          child: Column(
            children: [
              SizedBox(height: 10.0),
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
              SizedBox(height: 10),
              Consumer<CategoriesModel>(
                builder: (context, model, child) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _isDownloading
                                ? null
                                : () => _downloadAllSermons(context, model),
                            icon: _isDownloading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(Icons.download_rounded),
                            label: Text(
                                _isDownloading ? t.downloading : t.download),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 3, 92, 164),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          if (model.totalSavedSermons > 0)
                            ElevatedButton.icon(
                              onPressed: _isDownloading
                                  ? null
                                  : () => model.deleteAllSermons(context),
                              icon: Icon(Icons.delete_forever),
                              label: Text('Delete All'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (_isDownloading)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: LinearProgressIndicator(
                            value: _downloadProgress,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 3, 92, 164)),
                          ),
                        ),
                      if (kDebugMode && model.totalSavedSermons > 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Saved Sermons: ${model.totalSavedSermons}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              Expanded(
                child: SermonBody(),
              ),
            ],
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
    return Consumer<CategoriesModel>(
      builder: (context, categoriesModel, child) {
        List<Categories>? items = categoriesModel.categories;

        if (items == null || items.isEmpty) {
          if (categoriesModel.isLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 20,
              ),
            );
          } else if (categoriesModel.isError) {
            return NoitemScreen(
              title: t.oops,
              message: t.dataloaderror,
              onClick: () {
                categoriesModel.loadItems();
              },
            );
          }
          return Center(child: Text(t.nosermons));
        }

        return ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final cat = items[index];
            // Get local media for this category if available
            final localMedia = categoriesModel.getCategoryMedia(cat.id);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: InkWell(
                onTap: () {
                  final localMedia = categoriesModel.getCategoryMedia(cat.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SermonPlayerScreen(
                        data: (cat, items),
                        localSermon: localMedia?.isNotEmpty == true
                            ? localMedia![0]
                            : null,
                      ),
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
        );
      },
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
  SermonButton({required this.week, required this.category});

  final Categories? category;
  final int week;

  @override
  _SermonButtonState createState() => _SermonButtonState();
}

class _SermonButtonState extends State<SermonButton> {
  final translator = GoogleTranslator();

  bool _hasError = false;
  bool _isLoading = true;
  String? _translatedWeek;

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
                  width: 10,
                ),
                Container(
                  height: 70,
                  width: 70,
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
                        left: 18,
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
                  child: AutoSizeText(
                    widget.category?.title ?? 'UNKNOWN',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
