import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/faqResult.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/pages/qaAnswerScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/common_item_card.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/img.dart';
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
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                      Text(
                      'Q&A'.toUpperCase(),
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: faqResult?.faqs.length ?? 0,
                        itemBuilder: (context, index) {
                          final faq = faqResult!.faqs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                QAAnswerScreen.routeName,
                                arguments: ScreenArguements(items: faq),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: index / 2 == 0
                                      ? Colors.lightBlue.shade200
                                      : Colors.white,
                                  boxShadow: index / 2 != 0
                                      ? null
                                      : [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
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
