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

class _SermonScreenItemState extends State<SermonScreenItem>
    with SingleTickerProviderStateMixin {
  late AppStateManager appManager;
  late TabController _tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final translator = GoogleTranslator();

  double _downloadProgress = 0.0;
  SermonDownloadService? _downloadService;
  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.83,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Tab Bar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 3, 92, 164),
                        Color(0xff0ebef4),
                      ],
                    ),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[600],
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud, size: 18),
                          SizedBox(width: 5),
                          Text('Online'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download_done, size: 18),
                          SizedBox(width: 5),
                          Consumer<CategoriesModel>(
                            builder: (context, model, child) {
                              return Text(
                                  'Downloaded (${model.totalSavedSermons})');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Bar View
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    OnlineSermonTab(
                      isDownloading: _isDownloading,
                      downloadProgress: _downloadProgress,
                      onDownloadAll: _downloadAllSermons,
                    ),
                    DownloadedSermonTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Online Sermon Tab
class OnlineSermonTab extends StatelessWidget {
  final bool isDownloading;
  final double downloadProgress;
  final Function(BuildContext, CategoriesModel) onDownloadAll;

  const OnlineSermonTab({
    Key? key,
    required this.isDownloading,
    required this.downloadProgress,
    required this.onDownloadAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // // Download All Section
        // Consumer<CategoriesModel>(
        //   builder: (context, model, child) {
        //     return Container(
        //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //       child: Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               ElevatedButton.icon(
        //                 onPressed: isDownloading
        //                     ? null
        //                     : () => onDownloadAll(context, model),
        //                 icon: isDownloading
        //                     ? SizedBox(
        //                         width: 20,
        //                         height: 20,
        //                         child: CircularProgressIndicator(
        //                           valueColor: AlwaysStoppedAnimation<Color>(
        //                               Colors.white),
        //                           strokeWidth: 2,
        //                         ),
        //                       )
        //                     : Icon(Icons.download_rounded),
        //                 label: Text(
        //                     isDownloading ? t.downloading : 'Download All'),
        //                 style: ElevatedButton.styleFrom(
        //                   backgroundColor: Color.fromARGB(255, 3, 92, 164),
        //                   foregroundColor: Colors.white,
        //                   padding: EdgeInsets.symmetric(
        //                       horizontal: 20, vertical: 12),
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(25),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           if (isDownloading)
        //             Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 20, vertical: 8),
        //               child: LinearProgressIndicator(
        //                 value: downloadProgress,
        //                 backgroundColor: Colors.grey[200],
        //                 valueColor: AlwaysStoppedAnimation<Color>(
        //                     Color.fromARGB(255, 3, 92, 164)),
        //               ),
        //             ),
        //         ],
        //       ),
        //     );
        //   },
        // ),

        // Online Sermons List
        Expanded(
          child: SermonList(isOnlineTab: true),
        ),
      ],
    );
  }
}

// Downloaded Sermon Tab
class DownloadedSermonTab extends StatelessWidget {
  const DownloadedSermonTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Downloaded Sermons Header
        Consumer<CategoriesModel>(
          builder: (context, model, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Downloads',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        '${model.totalSavedSermons} sermons available offline',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  if (model.totalSavedSermons > 0)
                    ElevatedButton.icon(
                      onPressed: () => model.deleteAllSermons(context),
                      icon: Icon(Icons.delete_forever, size: 18),
                      label: Text('Clear All'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),

        // Downloaded Sermons List
        Expanded(
          child: SermonList(isOnlineTab: false),
        ),
      ],
    );
  }
}

// Reusable Sermon List
class SermonList extends StatelessWidget {
  final bool isOnlineTab;

  const SermonList({Key? key, required this.isOnlineTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isOnlineTab) {
      // Online tab - show online sermons
      return Consumer<CategoriesModel>(
        builder: (context, categoriesModel, child) {
          List<Categories>? items = categoriesModel.categories;

          return _buildSermonList(context, categoriesModel, items);
        },
      );
    } else {
      // Downloaded tab - show downloaded sermons
      return Consumer<CategoriesModel>(
        builder: (context, categoriesModel, child) {
          return FutureBuilder<List<Categories>>(
            future: categoriesModel.getDownloadedCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(radius: 20),
                      SizedBox(height: 15),
                      Text(
                        'Loading downloads...',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              }

              List<Categories>? items = snapshot.data;
              return _buildSermonList(context, categoriesModel, items);
            },
          );
        },
      );
    }
  }

  Widget _buildSermonList(BuildContext context, CategoriesModel categoriesModel,
      List<Categories>? items) {
    if (items == null || items.isEmpty) {
      if (categoriesModel.isLoading && isOnlineTab) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(radius: 20),
              SizedBox(height: 15),
              Text(
                'Loading sermons...',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        );
      } else if (categoriesModel.isError && isOnlineTab) {
        return NoitemScreen(
          title: t.oops,
          message: t.dataloaderror,
          onClick: () {
            categoriesModel.loadItems();
          },
        );
      }
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isOnlineTab ? Icons.cloud_off : Icons.download_done,
              size: 60,
              color: Colors.grey[400],
            ),
            SizedBox(height: 15),
            Text(
              isOnlineTab ? t.nosermons : 'No downloaded sermons',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            if (!isOnlineTab)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Download sermons from the Online tab',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        final cat = items[index];
        final localMedia = categoriesModel.getCategoryMedia(cat.id);

        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            onTap: () {
              final localMedia = categoriesModel.getCategoryMedia(cat.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SermonPlayerScreen(
                    data: (cat, items),
                    localSermon:
                        localMedia?.isNotEmpty == true ? localMedia![0] : null,
                  ),
                ),
              );
            },
            child: SermonButton(
              week: index + 1,
              category: cat,
              isOnlineTab: isOnlineTab,
            ),
          ),
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
  SermonButton(
      {required this.week, required this.category, this.isOnlineTab = true});

  final Categories? category;
  final int week;
  final bool isOnlineTab;

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
    return Consumer<CategoriesModel>(
      builder: (context, categoriesModel, child) {
        final categoryId = widget.category?.id ?? 0;
        final isDownloaded = categoriesModel.isSermonDownloaded(categoryId);
        final isDownloading = categoriesModel.isDownloading(categoryId);
        final downloadProgress =
            categoriesModel.getDownloadProgress(categoryId);
        final downloadStatus = categoriesModel.getDownloadStatus(categoryId);

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
                    // Download/Cancel buttons and progress - only show in online tab
                    if (widget.isOnlineTab) ...[
                      if (isDownloading)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  value: downloadProgress,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  strokeWidth: 3,
                                ),
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () => categoriesModel
                                    .cancelIndividualDownload(categoryId),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      else if (isDownloaded)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 24,
                              ),
                            ],
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () => categoriesModel
                                .startIndividualDownload(widget.category!),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.download,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                    ] else ...[
                      // Downloaded tab - show delete option
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 24,
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () => categoriesModel
                                  .deleteIndividualSermon(categoryId, context),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
