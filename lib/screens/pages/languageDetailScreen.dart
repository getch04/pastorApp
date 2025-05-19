import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/models/language_detail.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/pages/bibleScreenNew.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageDetailScreen extends StatefulWidget {
  LanguageDetailScreen({Key? key, required this.languageId}) : super(key: key);
  static const routeName = "/LanguageDetailScreen";
  final dynamic languageId;

  @override
  _LanguageDetailScreenState createState() => _LanguageDetailScreenState();
}

class _LanguageDetailScreenState extends State<LanguageDetailScreen> {
  bool isLoading = true;
  List<BibleVersion> result = [];
  Dio dio = Dio();
  late AppStateManager appManager;

  Future<void> getDetail() async {
    try {
      var response = await dio.get(
          '$BIBLE_BASE_URL/bibles?language_code=${widget.languageId}&v=4&key=$BIBLE_API_KEY');
      final res = response.data['data'] as List;

      // Convert the response into a list of BibleVersion objects
      final List<BibleVersion> resa =
          res.map((e) => BibleVersion.fromJson(e)).toList();

      // Filter the list to remove BibleVersions without "dbp-prod" or without any "text" filesets
      final List<BibleVersion> filteredVersions = resa.where((bibleVersion) {
        // Check if "dbp-prod" exists in the filesets map
        if (!bibleVersion.filesets.containsKey('dbp-prod')) {
          return false;
        }

        // Check if there are any filesets in "dbp-prod" with a type that starts with "text"
        bool hasTextFileset = bibleVersion.filesets['dbp-prod']!.any((fileset) {
          return fileset.type.startsWith('text');
        });

        return hasTextFileset;
      }).toList();

      setState(() {
        result = filteredVersions
            .where(
                (element) => element.name != 'New Life Version (Easy to Read)')
            .toList();
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
    getDetail();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BibleFilterProvider filterProvider =
        Provider.of<BibleFilterProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await showDialog(
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
              )) ??
              false;
        }
        return true;
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.81,
          width: MediaQuery.of(context).size.width,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : result.isEmpty
                  ? Center(child: Text(t.noitemstodisplay))
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              '${result.first.language}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              '${result.first.language} ' + t.biblebooks,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.71,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                final trans = result[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  child: ListTile(
                                    leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          trans.abbr.toString().substring(3, 6),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      trans.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      appManager.selectedBibleVersion = trans;
                                      // filterProvider.setTranslation(trans);
                                      Navigator.pushNamed(
                                        context,
                                        BibleScreenNew.routeName,
                                      );
                                    },
                                  ),
                                );
                              },
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
