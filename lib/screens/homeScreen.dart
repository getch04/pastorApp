import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../i18n/strings.g.dart';
import '../providers/AudioPlayerModel.dart';
import '../providers/HomeProvider.dart';
import '../screens/DrawerScreen.dart';
import '../utils/my_colors.dart';
import 'Home.dart';

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await (showDialog(
                context: context,
                builder: (context) => new CupertinoAlertDialog(
                  title: new Text(t.quitapp),
                  content: new Text(t.quitappaudiowarning),
                  actions: <Widget>[
                    new ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(t.cancel),
                    ),
                    new ElevatedButton(
                      onPressed: () {
                        Provider.of<AudioPlayerModel>(context, listen: false)
                            .cleanUpResources();
                        Navigator.of(context).pop(true);
                      },
                      child: new Text(t.ok),
                    ),
                  ],
                ),
              ))) ??
              false;
        } else {
          return (await (showDialog(
                context: context,
                builder: (context) => new CupertinoAlertDialog(
                  title: new Text(t.quitapp),
                  content: new Text(t.quitappwarning),
                  actions: <Widget>[
                    new ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(t.cancel),
                    ),
                    new ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: new Text(t.ok),
                    ),
                  ],
                ),
              ))) ??
              false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.appname, style: TextStyles.title(context)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[300]!,
                  Colors.purple[300]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ChangeNotifierProvider(
                create: (context) => HomeProvider(),
                child: MyHomePage(),
              ),
            ),
          ],
        ),
        drawer: Container(
          color: MyColors.grey_95,
          width: 300,
          child: Drawer(
            child: DrawerScreen(),
          ),
        ),
        key: scaffoldKey,
      ),
    );
  }
}
