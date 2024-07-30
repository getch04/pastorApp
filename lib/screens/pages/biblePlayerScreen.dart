import 'dart:convert';

import 'package:churchapp_flutter/audio_player/player_carousel_new.dart';
import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/models/bibleApiResponse.dart';
import 'package:churchapp_flutter/models/models/bible_file_response.dart';
import 'package:churchapp_flutter/models/models/bible_text_response.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/common_item_card.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<BibleApiResponse> fetchBibleByName() async {
  final response = await http.get(
    Uri.parse(
        'https://4.dbt.io/api/bibles?language_code=ENG&page=1&limit=1&version=KJV&v=4'),
    headers: {
      'key': BIBLE_API_KEY,
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data['data'].isNotEmpty) {
      return BibleApiResponse.fromJson(data['data'][0]);
    } else {
      throw Exception('No Bible found');
    }
  } else {
    throw Exception('Failed to fetch Bible');
  }
}

Future<List<BibleFile>> fetchBibleAudioByVerse(String textFilesetId) async {
  final response = await http.get(
    Uri.parse('https://4.dbt.io/api/bibles/filesets/$textFilesetId/MAT/1?v=4'),
    headers: {
      'key': BIBLE_API_KEY,
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data['data'].isNotEmpty) {
      return BibleFileResponse.fromJson(data).data;
    } else {
      throw Exception('No Bible text found');
    }
  } else {
    throw Exception('Failed to load Bible text');
  }
}

//fetch bible text by verse
Future<List<BibleText>> fetchBibleTextByVerse(String textFilesetId) async {
  final response = await http.get(
    Uri.parse('https://4.dbt.io/api/bibles/filesets/$textFilesetId/MAT/1?v=4'),
    headers: {
      'key': BIBLE_API_KEY,
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data['data'].isNotEmpty) {
      return BibleTextData.fromJson(data).data;
    } else {
      throw Exception('No Bible text found');
    }
  } else {
    throw Exception('Failed to load Bible text');
  }
}

class BiblePlayerScreen extends StatefulWidget {
  BiblePlayerScreen({Key? key}) : super(key: key);
  static const routeName = '/BiblePlayerScreen';

  @override
  _BiblePlayerScreenState createState() => _BiblePlayerScreenState();
}

class _BiblePlayerScreenState extends State<BiblePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return BiblePlayerScreenItem();
  }
}

class BiblePlayerScreenItem extends StatefulWidget {
  BiblePlayerScreenItem({Key? key}) : super(key: key);

  @override
  _BiblePlayerScreenItemState createState() => _BiblePlayerScreenItemState();
}

class _BiblePlayerScreenItemState extends State<BiblePlayerScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<BibleText> bibleTexts = [];
  String audioUrl = '';
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    fetchBibleContent();
  }

  Future<void> fetchBibleContent() async {
    try {
      final bibleData = await fetchBibleByName();
      final audioFilesetId = bibleData.filesets
          .firstWhere((fileset) => fileset.type == 'audio')
          .id;
      final textFilesetId = bibleData.filesets
          .firstWhere((fileset) => fileset.type.startsWith('text'))
          .id;

      final bibleAudioFiles = await fetchBibleAudioByVerse(audioFilesetId);
      final audioFiles = await fetchBibleTextByVerse(textFilesetId);

      setState(() {
        bibleTexts = audioFiles;
        audioUrl = bibleAudioFiles.first.path ?? '';
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;

    final style = TextStyles.title(context).copyWith(
      // fontWeight: FontWeight.bold,
      fontSize: 18,
    );

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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(height: 15),
              Container(
                height: 70,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CommonItemCard(
                    title: t.biblebooks,
                    icon: Image.asset(
                      Img.get('new/bible.png'),
                      width: 40,
                      height: 40,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(height: 10),
              if (audioUrl.isNotEmpty) PlayerNew(audioUrl: audioUrl),
              SizedBox(height: 10),
              if (bibleTexts.isNotEmpty) ...[
                Text(
                  'Chapter ${bibleTexts.first.chapter.toString()}',
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: ListView(
                      shrinkWrap: true,
                      children: bibleTexts
                          .map(
                            (text) => ListTile(
                              leading: Text(
                                text.verseStart.toString(),
                                style: style.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              title: Text(
                                text.verseText,
                                style: style,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTileItem extends StatelessWidget {
  const HomeTileItem({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

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
