import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/models/howto_model.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/pages/howToScreenDetail.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
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

  Future<void> getHowTo() async {
    try {
      var response = await dio.get(ApiUrl.GET_HOWTO);
      final data = jsonDecode(response.data);
      List<dynamic> faqsJson = data['faqs'];
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
    getHowTo();
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
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Text(
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: howtoResult.length,
                        itemBuilder: (context, index) {
                          final howTo = howtoResult[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                HowToDetailScreen.routeName,
                                arguments: ScreenArguements(items: howTo),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                color: Colors.lightBlue.shade200,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  howTo.question,
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
