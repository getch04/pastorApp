import 'dart:convert';

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
import 'package:provider/provider.dart';

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
        final title1 = res['audio']['${language}_title'] as String?;
        final streamUrl1 = res['audio']['stream'] as String?;
        final description1 =
            res['audio']['${language}_description'] as String? ??
                res['audio']['description'] as String?;
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
    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.83,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height * 0.55,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 10.0),
                    // if (title != null)
                    Center(
                      child: Text(
                        title ??
                            'There is no description avaliable for this Sermon',
                        textAlign: TextAlign.center,
                        style: TextStyles.title(context).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    if (!isLoading && worshipUrl != null) ...[
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Worship Audio',
                          style: TextStyles.title(context).copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
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
                          );
                        },
                      ),
                    ],
                    if (!isLoading && sermonUrl != null) ...[
                      Center(
                        child: Text(
                          'Sermon Audio',
                          style: TextStyles.title(context).copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
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
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
                hasScrollBody: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    description1 ?? '',
                    style: TextStyles.title(context).copyWith(fontSize: 18),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
