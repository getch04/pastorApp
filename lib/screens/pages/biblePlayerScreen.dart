import 'package:churchapp_flutter/audio_player/player_carousel_new.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/bible_text_response.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller.dart';
import 'package:churchapp_flutter/screens/provider/bible_media_controller.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BiblePlayerScreen extends StatefulWidget {
  BiblePlayerScreen({Key? key, required this.data}) : super(key: key);
  static const routeName = '/BiblePlayerScreen';

  final (
    int, //max chapter
    String,
    BibleBook,
  ) data;

  @override
  _BiblePlayerScreenState createState() => _BiblePlayerScreenState();
}

class _BiblePlayerScreenState extends State<BiblePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioController()),
        ChangeNotifierProxyProvider<AudioController, BibleMediaController>(
          create: (context) => BibleMediaController(
              Provider.of<AudioController>(context, listen: false)),
          update: (context, audioController, bibleMediaController) =>
              bibleMediaController!..audioController = audioController,
        ),
      ],
      child: BiblePlayerScreenItem(data: widget.data),
    );
  }
}

class BiblePlayerScreenItem extends StatefulWidget {
  BiblePlayerScreenItem({Key? key, required this.data}) : super(key: key);
  final (int, String, BibleBook) data;
  //max chapter ,// chapter id
  @override
  _BiblePlayerScreenItemState createState() => _BiblePlayerScreenItemState();
}

class _BiblePlayerScreenItemState extends State<BiblePlayerScreenItem> {
  final ScrollController _scrollController = ScrollController();
  late BibleMediaController _bibleMediaController;
  late BibleFilterProvider _filterProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bibleMediaController =
          Provider.of<BibleMediaController>(context, listen: false);
      _filterProvider =
          Provider.of<BibleFilterProvider>(context, listen: false);
      _bibleMediaController.initData(int.tryParse(widget.data.$2) ?? 1,
          _filterProvider, widget.data.$3, widget.data.$1);
    });
  }

  @override
  void dispose() {
    _bibleMediaController.audioController.stop();
    _bibleMediaController.audioController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<BibleMediaController, bool>(
      selector: (_, controller) => controller.isLoading,
      builder: (context, isLoading, child) {
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
                            Provider.of<AudioPlayerModel>(context,
                                    listen: false)
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
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      t.biblebooks.toUpperCase(),
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
                    Selector<BibleMediaController, String>(
                      selector: (_, controller) => controller.audioUrl,
                      builder: (context, audioUrl, child) {
                        return audioUrl.isNotEmpty
                            ? Container(
                                height: 200,
                                child: AudioPlayerWidget(
                                  audioUrl: audioUrl,
                                  onNext: Provider.of<BibleMediaController>(
                                          context,
                                          listen: false)
                                      .goToNextChapter,
                                  onPrevious: Provider.of<BibleMediaController>(
                                          context,
                                          listen: false)
                                      .goToPreviousChapter,
                                ),
                              )
                            : SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 10),
                    Selector<BibleMediaController, int>(
                      selector: (_, controller) => controller.currentChapter,
                      builder: (context, currentChapter, child) {
                        return Text(
                          t.chapter + '$currentChapter',
                          textAlign: TextAlign.center,
                          style: TextStyles.title(context).copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Selector<BibleMediaController, List<BibleText>>(
                              selector: (_, controller) =>
                                  controller.bibleTexts,
                              builder: (context, bibleTexts, child) {
                                return bibleTexts.isNotEmpty
                                    ? ListView.builder(
                                        controller: _scrollController,
                                        itemCount: bibleTexts.length,
                                        itemBuilder: (context, index) {
                                          final text = bibleTexts[index];
                                          return ListTile(
                                            leading: Text(
                                              text.verseStart.toString(),
                                              style: TextStyles.title(context)
                                                  .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            title: Text(
                                              text.verseText,
                                              style: TextStyles.title(context)
                                                  .copyWith(
                                                fontSize: 18,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Text(t.noBibleTextsAvailable),
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
      },
    );
  }
}

class AudioPlayerWidget extends StatelessWidget {
  final String audioUrl;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  AudioPlayerWidget({
    required this.audioUrl,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioController>(
      builder: (context, audioController, child) {
        return PlayerNew(
          audioUrl: audioUrl,
          onNext: onNext,
          onPrevious: onPrevious,
          isPlaying: audioController.isPlaying,
          isLoading: audioController.isLoading,
          duration: audioController.duration,
          position: audioController.position,
          onPlay: () => audioController.play(audioUrl),
          onPause: audioController.pause,
          onSeek: audioController.seek,
        );
      },
    );
  }
}
