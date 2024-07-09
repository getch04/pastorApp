import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/faqResult.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/DrawerScreen.dart';
import 'package:churchapp_flutter/screens/pages/qaAnswerScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:churchapp_flutter/utils/title_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QAListScreen extends StatefulWidget {
  QAListScreen({Key? key}) : super(key: key);
  static const routeName = "/QAListScreen";

  @override
  _QAListScreenState createState() => _QAListScreenState();
}

class _QAListScreenState extends State<QAListScreen> {
  @override
  Widget build(BuildContext context) {
    return QAListScreenItem();
  }
}

class QAListScreenItem extends StatefulWidget {
  QAListScreenItem({
    Key? key,
  }) : super(key: key);

  @override
  _QAListScreenItemState createState() => _QAListScreenItemState();
}

class _QAListScreenItemState extends State<QAListScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FAQResponse? faqResult;
  bool isLoading = true;
  Dio dio = Dio();

  Future<void> getAboutUs() async {
    try {
      var response = await dio.get(ApiUrl.GET_FAQ);
      final faq = FAQResponse.fromJson(jsonDecode(response.data));
      setState(() {
        faqResult = faq;
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
    getAboutUs();
  }

  @override
  Widget build(BuildContext context) {
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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                      height: 10,
                    ),
                    Container(
                      color: MyColors.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset(
                              Img.get('new/qa1.png'),
                              height: 50,
                              width: 50,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Questions & Answers',
                                  textAlign: TextAlign.center,
                                  style: TextStyles.title(context).copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: faqResult?.faqs.length ?? 0,
                        itemBuilder: (context, index) {
                          final faq = faqResult!.faqs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, QAAnswerScreen.routeName,
                                    arguments: ScreenArguements(items: faq));
                              },
                              child: Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    faq.question,
                                    textAlign: TextAlign.center,
                                    style: TextStyles.title(context).copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
