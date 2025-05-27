import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:churchapp_flutter/audio_player/player_carousel_new.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller2.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SermonPlayerScreen extends StatefulWidget {
  SermonPlayerScreen({Key? key, required this.categories}) : super(key: key);
  static const routeName = "/SermonPlayerScreen";

  final Categories categories;

  @override
  _SermonPlayerScreenState createState() => _SermonPlayerScreenState();
}

class _SermonPlayerScreenState extends State<SermonPlayerScreen> {
  String? title;
  String? sermonUrl;
  String? worshipUrl;
  String? description1;
  bool isLoading = true;
  Dio dio = Dio();
  AudioController? _audioController;
  AudioController2? _audioController2;
  late AppStateManager appManager;
  double _worshipSpeed = 1.0;
  double _sermonSpeed = 1.0;

  Future<void> getCategoryAudio() async {
    try {
      String language =
          appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                  ?['value'] ??
              'en';

      var response = await dio.get(
          ApiUrl.CATEGORY_AUDIO + '${widget.categories.id}?lang=$language');
      final res = jsonDecode(response.data);

      if (res['audio'] != null) {
        final title1 = res['audio']['title'] as String?;
        final streamUrl1 = res['audio']['stream'] as String?;
        final description1 = res['audio']['description'] as String?;
        final streamUrl2 = res['audio'] != null
            ? res['audio']['worship_stream'] as String?
            : null;

        setState(() {
          this.sermonUrl = streamUrl1;
          this.description1 = description1;
          this.worshipUrl = streamUrl2;
          this.title = title1;
          isLoading = false;
        });
      } else {
        setState(() {
          sermonUrl = null;
          worshipUrl = null;
          isLoading = false;
        });
      }
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
    getCategoryAudio();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _audioController = Provider.of<AudioController>(context, listen: false);
    _audioController2 = Provider.of<AudioController2>(context, listen: false);
  }

  @override
  void dispose() {
    _audioController?.stop();
    _audioController2?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define theme colors for the description section
    final primaryColor = Colors.indigo.shade700;
    final accentColor = Colors.lightBlue.shade300;
    final lightColor = Colors.lightBlue.shade50;

    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AutoSizeText(
                title != null ? title!.toUpperCase() : 'SERMON',
                textAlign: TextAlign.center,
                // maxLines: 3,
                style: TextStyles.title(context).copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 4,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                      Icons.headphones_rounded,
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
              child: isLoading
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(accentColor),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Loading audio...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        // top: 8.0,
                        bottom: 100.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Worship Audio Section - Remove external speed controller row
                          if (worshipUrl != null) ...[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Consumer<AudioController2>(
                                    builder: (context, ctr, child) {
                                      return PlayerNew(
                                        audioUrl: worshipUrl ?? '',
                                        onNext: () {},
                                        onPrevious: () {},
                                        isPlaying: ctr.isPlaying,
                                        isLoading: ctr.isLoading,
                                        duration: ctr.duration,
                                        position: ctr.position,
                                        onPlay: () {
                                          _audioController?.pause();
                                          ctr.play(worshipUrl ?? '');
                                        },
                                        onPause: ctr.pause,
                                        onSeek: ctr.seek,
                                        playbackSpeed: _worshipSpeed,
                                        onSpeedChange: (speed) {
                                          setState(() => _worshipSpeed = speed);
                                          ctr.setPlaybackSpeed(speed);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],

                          // Sermon Audio Section - Remove external speed controller row
                          if (sermonUrl != null) ...[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Consumer<AudioController>(
                                    builder: (context, ctr, child) {
                                      return PlayerNew(
                                        audioUrl: sermonUrl ?? '',
                                        onNext: () {},
                                        onPrevious: () {},
                                        isPlaying: ctr.isPlaying,
                                        isLoading: ctr.isLoading,
                                        duration: ctr.duration,
                                        position: ctr.position,
                                        onPlay: () {
                                          _audioController2?.pause();
                                          ctr.play(sermonUrl ?? '');
                                        },
                                        onPause: ctr.pause,
                                        onSeek: ctr.seek,
                                        playbackSpeed: _sermonSpeed,
                                        onSpeedChange: (speed) {
                                          setState(() => _sermonSpeed = speed);
                                          ctr.setPlaybackSpeed(speed);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],

                          // Description Section - Keep decorated
                          if (description1 != null)
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              elevation: 4,
                              shadowColor: primaryColor.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: lightColor.withOpacity(0.5),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 28,
                                            width: 28,
                                            decoration: BoxDecoration(
                                              color: lightColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.description_outlined,
                                                color: primaryColor,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "DESCRIPTION",
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      DynamicHtmlContent(
                                        htmlData: description1!,
                                      ),
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          // No Content Message
                          if (sermonUrl == null &&
                              worshipUrl == null &&
                              description1 == null)
                            Container(
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
                                    'No audio content available',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicHtmlContent extends StatelessWidget {
  final String htmlData;

  DynamicHtmlContent({required this.htmlData});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      style: {
        "body": Style(
          fontSize: FontSize(16.0),
          lineHeight: LineHeight(1.5),
          color: Colors.black.withOpacity(0.8),
        ),
        "a": Style(
          color: Colors.indigo.shade700,
          textDecoration: TextDecoration.none,
        ),
      },
      onLinkTap: (url, _, __) async {
        if (url != null && await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
