import 'dart:convert';

import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/faqResult.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/screens/pages/qaAnswerScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QAListScreen extends StatefulWidget {
  QAListScreen({Key? key}) : super(key: key);
  static const routeName = "/QAListScreen";

  @override
  _QAListScreenState createState() => _QAListScreenState();
}

class _QAListScreenState extends State<QAListScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FAQResponse? faqResult;
  bool isLoading = true;
  Dio dio = Dio();
  late AppStateManager appManager;

  Future<void> getFAQ() async {
    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';
    try {
      var response = await dio.get(ApiUrl.GET_FAQ + "?lang=$language");
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
    appManager = Provider.of<AppStateManager>(context, listen: false);
    getFAQ();
  }

  @override
  Widget build(BuildContext context) {
    // Define main theme colors
    final primaryColor = Colors.indigo.shade700;
    final accentColor = Colors.lightBlue.shade300;
    final lightColor = Colors.lightBlue.shade50;

    return GlobalScaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: isLoading
              ? Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: accentColor.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor),
                            strokeWidth: 3,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Loading Q&A...',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    // Keep the original title
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
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
                    ),
                    // Decorative divider
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.7),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.question_answer_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white.withOpacity(0.7),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FAQ List
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        width: MediaQuery.of(context).size.width,
                        child: faqResult?.faqs.length == 0
                            ? Center(
                                child: Text(
                                  'No FAQs available',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                padding:
                                    EdgeInsets.only(top: 12.0, bottom: 150.0),
                                itemCount: faqResult?.faqs.length ?? 0,
                                itemBuilder: (context, index) {
                                  final faq = faqResult!.faqs[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(16),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            QAAnswerScreen.routeName,
                                            arguments:
                                                ScreenArguements(items: faq),
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(16),
                                        splashColor:
                                            accentColor.withOpacity(0.2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            boxShadow: [
                                              BoxShadow(
                                                color: primaryColor
                                                    .withOpacity(0.05),
                                                blurRadius: 12,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                            border: Border.all(
                                              color:
                                                  lightColor.withOpacity(0.5),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(18.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: 35,
                                                  decoration: BoxDecoration(
                                                    color: lightColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons
                                                          .help_outline_rounded,
                                                      color: primaryColor,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Text(
                                                    faq.question,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      height: 1.4,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: lightColor
                                                        .withOpacity(0.4),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: primaryColor,
                                                      size: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
