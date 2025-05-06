import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/models/howto_model.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/pages/howToScreenDetail.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HowToScreen extends StatefulWidget {
  HowToScreen({Key? key}) : super(key: key);
  static const routeName = "/HowToScreen";

  @override
  _HowToScreenState createState() => _HowToScreenState();
}

class _HowToScreenState extends State<HowToScreen> {
  bool isLoading = true;
  Dio dio = Dio();
  List<HowToModel> howtoResult = [];
  late AppStateManager appManager;

  Future<void> getHowTo() async {
    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';
    try {
      var response = await dio.get(ApiUrl.GET_HOWTO + "?lang=$language");
      final data = jsonDecode(response.data);
      List<dynamic> faqsJson = data['hows'];
      List<HowToModel> faqsList =
          faqsJson.map((faqJson) => HowToModel.fromJson(faqJson)).toList();

      setState(() {
        howtoResult = faqsList;
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
    getHowTo();
  }

  @override
  Widget build(BuildContext context) {
    // Define theme colors
    final primaryColor = Colors.indigo.shade700;
    final accentColor = Colors.lightBlue.shade300;
    final lightColor = Colors.lightBlue.shade50;

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
        body: SafeArea(
          bottom: true,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    t.howTo.toUpperCase(),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.help_outline_rounded,
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

                // Content Area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: isLoading
                        ? Center(
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          primaryColor),
                                      strokeWidth: 3,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Loading how-to guides...',
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
                        : howtoResult.isEmpty
                            ? Center(
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
                                      Icon(
                                        Icons.info_outline,
                                        color: accentColor,
                                        size: 50,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'No how-to guides available',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding:
                                    EdgeInsets.only(top: 12.0, bottom: 100.0),
                                itemCount: howtoResult.length,
                                itemBuilder: (context, index) {
                                  final howTo = howtoResult[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(16),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            HowToDetailScreen.routeName,
                                            arguments:
                                                ScreenArguements(items: howTo),
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
                                                      Icons.help_outline,
                                                      color: primaryColor,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                Expanded(
                                                  child: Text(
                                                    howTo.question,
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
      ),
    );
  }
}
