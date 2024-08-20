import 'package:churchapp_flutter/models/faqResult.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter_quill/youtube_player_flutter_quill.dart';

class QAAnswerScreen extends StatefulWidget {
  QAAnswerScreen({Key? key, required this.faq}) : super(key: key);
  static const routeName = "/QAAnswerScreen";

  final FAQ faq;

  @override
  _QAAnswerScreenState createState() => _QAAnswerScreenState();
}

class _QAAnswerScreenState extends State<QAAnswerScreen> with WidgetsBindingObserver {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    String videoId = extractYoutubeVideoId(widget.faq.embed_code??'');
    print("play youtube video = $videoId");
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  String extractYoutubeVideoId(String embedCode) {
    RegExp regExp = RegExp(r'src="https://www.youtube.com/embed/([^"]+)"');
    Match? match = regExp.firstMatch(embedCode);
    return match?.group(1) ?? '';
  }

  @override
  void deactivate() {
    _controller?.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _controller?.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
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
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                  widget.faq.question,
                  textAlign: TextAlign.center,
                  style: TextStyles.title(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Colors.lightBlue.shade200, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ]),
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.faq.answer,
                      textAlign: TextAlign.center,
                      style: TextStyles.title(context).copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _controller != null
                        ? YoutubePlayer(
                            controller: _controller!,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.blueAccent,
                            progressColors: ProgressBarColors(
                              playedColor: Colors.blue,
                              handleColor: Colors.blueAccent,
                            ),
                            onReady: () {
                              print("Player is ready.");
                            },
                          )
                        : CircularProgressIndicator(),
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