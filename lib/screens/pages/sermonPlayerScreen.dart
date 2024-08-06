import 'dart:convert';

import 'package:churchapp_flutter/audio_player/player_carousel_new.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller2.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
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
  String? sermonUrl;
  String? worshipUrl;
  String? description1;
  bool isLoading = true;
  Dio dio = Dio();
  AudioController? _audioController;
  AudioController2? _audioController2;

  Future<void> getCategoryAudio() async {
    try {
      var response =
          await dio.get(ApiUrl.CATEGORY_AUDIO + '${widget.categories.id}');
      final res = jsonDecode(response.data);
      if (res['audio'] != null && res['audio']['stream'] != null) {
        final streamUrl1 = res['audio']['stream'] as String?;
        final description1 = res['audio']['description'] as String?;
        final streamUrl2 = res['audio'] != null
            ? res['audio']['worship_stream'] as String?
            : null;

        setState(() {
          this.sermonUrl = streamUrl1;
          this.description1 = description1;
          this.worshipUrl = streamUrl2;
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
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    widget.categories.title ?? '',
                    style: TextStyles.title(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Worship Audio',
                    style: TextStyles.title(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  if (!isLoading && worshipUrl != null)
                    Consumer<AudioController2>(builder: (context, ctr, child) {
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
                    }),
                  SizedBox(height: 25),
                  Text(
                    'Sermon Audio',
                    style: TextStyles.title(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  if (!isLoading && sermonUrl != null)
                    Consumer<AudioController>(builder: (context, ctr, child) {
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
                    }),
                  SizedBox(height: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        description1 ?? '',
                        style: TextStyles.title(context).copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  //   child: Text(
                  //     description2 ?? '',
                  //     style: TextStyles.title(context).copyWith(fontSize: 18),
                  //   ),
                  // ),
                ],
              ),
      ),
    );
  }
}
