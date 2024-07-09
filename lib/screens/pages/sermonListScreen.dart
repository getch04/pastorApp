import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/DrawerScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonPlayerScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:churchapp_flutter/utils/title_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SermonListScreen extends StatefulWidget {
  SermonListScreen({Key? key}) : super(key: key);
  static const routeName = "/SermonListScreen";

  @override
  _SermonListScreenState createState() => _SermonListScreenState();
}

class _SermonListScreenState extends State<SermonListScreen> {
  @override
  Widget build(BuildContext context) {
    return SermonListScreenItem();
  }
}

class SermonListScreenItem extends StatefulWidget {
  SermonListScreenItem({
    Key? key,
  }) : super(key: key);

  @override
  _SermonListScreenItemState createState() => _SermonListScreenItemState();
}

class _SermonListScreenItemState extends State<SermonListScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
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
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      color: MyColors.primaryLight,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/new/bible3.png',
                            width: 60,
                            height: 50,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '1 year of Sermons',
                            style: TextStyles.title(context).copyWith(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SermonPlayerScreen.routeName);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  color: MyColors.white,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('week', style: style),
                                          Text("1.", style: style)
                                        ],
                                      ),
                                      // Spacer(),
                                      Expanded(
                                        child: Text(
                                          'How to teach',
                                          textAlign: TextAlign.center,
                                          style: TextStyles.title(context)
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30),
                                        ),
                                      ),
                                      // Spacer()
                                    ],
                                  ),
                                ),
                              ),
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
