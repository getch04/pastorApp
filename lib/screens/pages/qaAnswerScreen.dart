import 'package:churchapp_flutter/models/faqResult.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:youtube_player_flutter_quill/youtube_player_flutter_quill.dart';

class QAAnswerScreen extends StatefulWidget {
  QAAnswerScreen({Key? key, required this.faq}) : super(key: key);
  static const routeName = "/QAAnswerScreen";

  final FAQ faq;

  @override
  _QAAnswerScreenState createState() => _QAAnswerScreenState();
}

class _QAAnswerScreenState extends State<QAAnswerScreen>
    with WidgetsBindingObserver {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final content = widget.faq.embed_code ?? '';

    // Check if content is an iframe or a direct URL
    final srcUrl =
        content.contains('<iframe') ? extractSrcFromIframe(content) : content;
    final videoId = YoutubePlayer.convertUrlToId(srcUrl ?? '');

    print("play youtube video = $videoId");
    if (videoId != null && videoId.isNotEmpty) {
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
  }

  @override
  void deactivate() {
    _controller?.pause();
    super.deactivate();
  }

  // Helper function to extract the src attribute from the iframe
  String? extractSrcFromIframe(String iframeHtml) {
    final document = parse(iframeHtml);
    final iframeElement = document.getElementsByTagName('iframe').first;
    return iframeElement.attributes['src'];
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
    // Check if content is an iframe or a direct URL
    final srcUrl = widget.faq.embed_code != null &&
            widget.faq.embed_code!.contains('<iframe')
        ? extractSrcFromIframe(widget.faq.embed_code ?? '')
        : widget.faq.embed_code;
    final videoId = YoutubePlayer.convertUrlToId(srcUrl ?? '');

    // Get the screen size
    final size = MediaQuery.of(context).size;

    // Define main theme colors
    final primaryColor = Colors.indigo.shade700;
    final accentColor = Colors.lightBlue.shade300;
    final lightColor = Colors.lightBlue.shade50;
    final darkColor = Colors.indigo.shade900;

    return GlobalScaffold(
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              // Content Area
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    // top: 16.0,
                    bottom: 100.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Question Card
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
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
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
                                          Icons.help_outline_rounded,
                                          color: primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "QUESTION",
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
                                Text(
                                  widget.faq.question,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: darkColor,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Answer Card
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        shadowColor: accentColor.withOpacity(0.5),
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
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
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
                                          Icons.lightbulb_outline_rounded,
                                          color: primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "ANSWER",
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
                                Text(
                                  widget.faq.answer,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.8),
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // YouTube Player Card
                      if (_controller != null && videoId != null)
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 12),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            Icons.play_circle_outline_rounded,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "VIDEO EXPLANATION",
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
                                  SizedBox(
                                    width: size.width,
                                    child: YoutubePlayer(
                                      controller: _controller!,
                                      showVideoProgressIndicator: true,
                                      progressIndicatorColor: accentColor,
                                      progressColors: ProgressBarColors(
                                        playedColor: primaryColor,
                                        handleColor: accentColor,
                                      ),
                                      onReady: () {
                                        print("Player is ready.");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: 20),
                    ],
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
