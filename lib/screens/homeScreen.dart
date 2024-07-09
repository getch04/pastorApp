import 'package:churchapp_flutter/models/Userdata.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/DrawerScreen.dart';
import 'package:churchapp_flutter/screens/pages/biblePlayerScreen.dart';
import 'package:churchapp_flutter/screens/pages/qaListScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonScreen.dart';
import 'package:churchapp_flutter/screens/pages/toolsScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:churchapp_flutter/utils/title_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../i18n/strings.g.dart';
import '../providers/AudioPlayerModel.dart';
import '../utils/my_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScreenItem();
  }
}

class HomeScreenItem extends StatefulWidget {
  HomeScreenItem({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenItemState createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  int _currentNavIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Userdata? userdata = Provider.of<AppStateManager>(context).userdata;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
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
        } else {
          return (await (showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text(t.quitapp),
                  content: Text(t.quitappwarning),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(t.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text(t.ok),
                    ),
                  ],
                ),
              ))) ??
              false;
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: MyColors.primaryLight,
          automaticallyImplyLeading: false,
          leadingWidth: 80,
          leading: Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only(left: 20),
            child: Image.asset(
              Img.get('new/1.png'),
              height: 150,
              width: 150,
            ),
          ),
          title: Text(
            t.appname.toTitleCase(),
            style: TextStyles.title(context)
                .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                margin: EdgeInsets.only(right: 20),
                height: 30,
                width: 30,
                child: Image.asset(
                  Img.get('new/menu.png'),
                ),
              ),
            ),
          ],
        ),
        drawer: Container(
          padding: EdgeInsets.only(top: statusBarHeight + appBarHeight + 1),
          child: Drawer(
            child: ChangeNotifierProvider(
                create: (context) => HomeProvider(), child: DrawerScreen()),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MyColors.bgTop,
                MyColors.bgBottom,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${t.homesentence}',
                        textAlign: TextAlign.center,
                        style: TextStyles.subhead(context).copyWith(
                          color: MyColors.nearlyBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 35),
                          child: ListView(
                            children: [
                              HomeTileItem(
                                title: t.sermons,
                                iconPath: Img.get('new/sermon.png'),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(SermonScreen.routeName);
                                },
                              ).animate().fadeIn(duration: 300.ms).slide(
                                    duration: 300.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              HomeTileItem(
                                title: t.biblebooks,
                                iconPath: Img.get('new/bible.png'),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(BiblePlayerScreen.routeName);
                                },
                              ).animate().fadeIn(duration: 600.ms).slide(
                                    duration: 600.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              HomeTileItem(
                                title: 'Q & A\'s',
                                iconPath: Img.get('new/Q&A.png'),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(QAListScreen.routeName);
                                },
                              ).animate().fadeIn(duration: 900.ms).slide(
                                    duration: 900.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              HomeTileItem(
                                title: t.tools,
                                iconPath: Img.get('new/tools.png'),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ToolsScreen.routeName,
                                  );
                                },
                              ).animate().fadeIn(duration: 1200.ms).slide(
                                    duration: 1200.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTileItem extends StatelessWidget {
  const HomeTileItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  final String title;
  final String iconPath;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 120,
        decoration: BoxDecoration(
          color: MyColors.primaryLight,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyles.title(context)
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
