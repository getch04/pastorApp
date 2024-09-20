import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/models/Media.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/providers/ToolMediaModel.dart';
import 'package:churchapp_flutter/screens/NoitemScreen.dart';
import 'package:churchapp_flutter/screens/pages/toolsDetailScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/MediaItemTile.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ToolsScreen extends StatefulWidget {
  ToolsScreen({Key? key, required this.cat}) : super(key: key);
  static const routeName = "/ToolsScreen";

  final Categories? cat;

  @override
  _ToolsScreenState createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;
  Dio dio = Dio();
  late AppStateManager appManager;

  Future<void> getTools() async {
    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';
    try {
      var response = await dio.get(ApiUrl.GET_TOOLS + "?lang=$language");
      final faq = jsonDecode(response.data);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    appManager = Provider.of<AppStateManager>(context, listen: false);
    // getTools();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;

    final style = TextStyles.title(context)
        .copyWith(fontWeight: FontWeight.bold, fontSize: 20);
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
      child: ChangeNotifierProvider(
        create: (context) => ToolMediaModel(),
        child: GlobalScaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(children: [
              Text(
                t.tools.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyles.title(context).copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 10,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 70,
              //   width: 100,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 50),
              //     child: CommonItemCard(
              //       title: t.tools,
              //       icon: Image.asset(
              //         Img.get('new/tools.png'),
              //         width: 40,
              //         height: 40,
              //       ),
              //       onTap: () {},
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: MediaScreen(
                  categories: widget.cat,
                ),
              ),
              // Column(
              //   children: [
              //     SizedBox(
              //       height: 10,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, ToolsDetailScreen.routeName);
              //       },
              //       child: Container(
              //         color: Color(0xff5ad7ed),
              //         width: MediaQuery.of(context).size.width,
              //         child: Padding(
              //           padding: const EdgeInsets.all(20.0),
              //           child: Text(
              //             "howTo heal the sick?",
              //             textAlign: TextAlign.center,
              //             style: TextStyles.title(context).copyWith(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       color: Colors.white,
              //       width: MediaQuery.of(context).size.width,
              //       child: Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Text(
              //           "End to End",
              //           textAlign: TextAlign.center,
              //           style: TextStyles.title(context).copyWith(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       color: Color(0xff5ad7ed),
              //       width: MediaQuery.of(context).size.width,
              //       child: Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Text(
              //           "More tools",
              //           textAlign: TextAlign.center,
              //           style: TextStyles.title(context).copyWith(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}

class MediaScreen extends StatefulWidget {
  final Categories? categories;
  MediaScreen({this.categories});

  @override
  _CategoriesMediaScreenNewState createState() =>
      _CategoriesMediaScreenNewState();
}

class _CategoriesMediaScreenNewState extends State<MediaScreen> {
  late ToolMediaModel mediaScreensModel;
  late List<Media> items;

  void _onRefresh() async {
    mediaScreensModel.loadItems(widget.categories!.id, context);
  }

  void _onLoading() async {
    mediaScreensModel.loadMoreItems();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 0), () {
      Provider.of<ToolMediaModel>(context, listen: false)
          .loadItems(widget.categories!.id, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaScreensModel = Provider.of<ToolMediaModel>(context);
    items = mediaScreensModel.mediaList;

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text(t.pulluploadmore);
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text(t.loadfailedretry);
          } else if (mode == LoadStatus.canLoading) {
            body = Text(t.releaseloadmore);
          } else {
            body = Text(t.nomoredata);
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: mediaScreensModel.refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: (mediaScreensModel.isError == true && items.length == 0)
          ? NoitemScreen(
              title: t.oops,
              message: t.dataloaderror,
              onClick: _onRefresh,
            )
          : ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(3),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ToolsDetailScreen.routeName,
                        arguments: ScreenArguements(
                          position: 0,
                          items: items[index],
                       
                        ));
                  },
                  child: Container(
                    color: Color(0xff5ad7ed),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        items[index].title ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyles.title(context).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );

                ItemTileNew(
                  mediaList: items,
                  index: index,
                  object: items[index],
                );
              },
            ),
    );
  }
}
