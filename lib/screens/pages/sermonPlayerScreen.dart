import 'dart:convert';

import 'package:churchapp_flutter/audio_player/player_carousel_new.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SermonPlayerScreen extends StatefulWidget {
  SermonPlayerScreen({Key? key, required this.categories}) : super(key: key);
  static const routeName = "/SermonPlayerScreen";

  final Categories categories;

  @override
  _SermonPlayerScreenState createState() => _SermonPlayerScreenState();
}

class _SermonPlayerScreenState extends State<SermonPlayerScreen> {
  String? streamUrl;
  String? description;
  bool isLoading = true;
  Dio dio = Dio();
  AudioController? _audioController;

  Future<void> getCategoryAudio() async {
    try {
      var response =
          await dio.get(ApiUrl.CATEGORY_AUDIO + '${widget.categories.id}');
      final res = jsonDecode(response.data);
      if (res['audio'] != null && res['audio']['stream'] != null) {
        final streamUrl = res['audio']['stream'] as String?;
        final des = res['audio']['description'] as String?;
        setState(() {
          this.streamUrl = streamUrl;
          this.description = des;
          isLoading = false;
        });
      } else {
        setState(() {
          streamUrl = null;
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
  }

  @override
  void dispose() {
    _audioController?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.83,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.categories.title ?? '',
              style: TextStyles.title(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Worship Audio',
              style: TextStyles.title(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            PlayerNew(
              audioUrl: streamUrl ?? '',
              onNext: () {},
              onPrevious: () {},
              isPlaying: false,
              isLoading: false,
              duration: Duration.zero,
              position: Duration.zero,
              onPlay: () {},
              onPause: () {},
              onSeek: (val) {},
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Sermon Audio',
              style: TextStyles.title(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            if (!isLoading && streamUrl != null)
              Consumer<AudioController>(builder: (context, ctr, child) {
                return PlayerNew(
                  audioUrl: streamUrl ?? '',
                  onNext: () {},
                  onPrevious: () {},
                  isPlaying: ctr.isPlaying,
                  isLoading: ctr.isLoading,
                  duration: ctr.duration,
                  position: ctr.position,
                  onPlay: () => ctr.play(streamUrl ?? ''),
                  onPause: ctr.pause,
                  onSeek: ctr.seek,
                );
              }),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                description ?? '',
                style: TextStyles.title(context).copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
