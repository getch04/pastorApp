import 'dart:math' as math;
import 'dart:ui';

import 'package:churchapp_flutter/audio_player/player_carousel_new.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/bible_text_response.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller.dart';
import 'package:churchapp_flutter/screens/provider/bible_media_controller.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BiblePlayerScreen extends StatefulWidget {
  BiblePlayerScreen({Key? key, required this.data}) : super(key: key);
  static const routeName = '/BiblePlayerScreen';

  final (
    int, //max chapter
    String,
    BibleBook,
    List<String>,
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
  final (int, String, BibleBook, List<String>) data;
  //max chapter ,// chapter id
  @override
  _BiblePlayerScreenItemState createState() => _BiblePlayerScreenItemState();
}

class _BiblePlayerScreenItemState extends State<BiblePlayerScreenItem> {
  final ScrollController _scrollController = ScrollController();
  late BibleMediaController _bibleMediaController;
  late BibleFilterProvider _filterProvider;
  late AppStateManager appStateManager;
  double _playerHeight = 190.0;
  double _minPlayerHeight = 80.0;
  double _playerOpacity = 1.0;
  bool _isPlayerMinimized = false;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_disposed) return;
      appStateManager = Provider.of<AppStateManager>(context, listen: false);
      _bibleMediaController =
          Provider.of<BibleMediaController>(context, listen: false);
      _filterProvider =
          Provider.of<BibleFilterProvider>(context, listen: false);
      _bibleMediaController.initData(
          int.tryParse(widget.data.$2) ?? 1,
          _filterProvider,
          appStateManager.selectedBibleVersion!,
          widget.data.$3,
          widget.data.$1,
          widget.data.$4);
    });
  }

  void _onScroll() {
    if (_disposed) return;
    final scrollOffset = _scrollController.offset;
    final maxScroll = 100.0;

    setState(() {
      if (scrollOffset <= 0) {
        _playerHeight = 190.0;
        _playerOpacity = 1.0;
        _isPlayerMinimized = false;
      } else if (scrollOffset >= maxScroll) {
        _playerHeight = _minPlayerHeight;
        _playerOpacity = 0.95;
        _isPlayerMinimized = true;
      } else {
        final progress = scrollOffset / maxScroll;
        _playerHeight = 190.0 - ((190.0 - _minPlayerHeight) * progress);
        _playerOpacity = 1.0 - (0.05 * progress);
        _isPlayerMinimized = progress > 0.3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<BibleMediaController>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color.fromARGB(255, 88, 138, 179),
                Color.fromARGB(255, 160, 209, 224),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      Img.get('new/Logo.png'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MY VIRTUAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'PASTOR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              Img.get('new/bg_home.png'),
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Selector<BibleMediaController, bool>(
            selector: (_, controller) => controller.isLoading,
            builder: (context, isLoading, child) {
              return Stack(
                children: [
                  // Scrollable Content
                  Positioned.fill(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // Space for player
                          SizedBox(height: _playerHeight + 54),
                          // Verses
                          Selector<BibleMediaController, List<BibleText>>(
                            selector: (_, controller) => controller.bibleTexts,
                            builder: (context, bibleTexts, child) {
                              if (isLoading) {
                                return Center(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Frosted glass effect
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(28),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 8, sigmaY: 8),
                                          child: Container(
                                            width: 250,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 38, horizontal: 24),
                                            decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.28),
                                              borderRadius:
                                                  BorderRadius.circular(28),
                                              border: Border.all(
                                                color: Color(0xFFFF8E53)
                                                    .withOpacity(0.18),
                                                width: 1.5,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFFFF8E53)
                                                      .withOpacity(0.10),
                                                  blurRadius: 32,
                                                  offset: Offset(0, 8),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Floating Bible icon
                                                TweenAnimationBuilder<double>(
                                                  tween: Tween(
                                                      begin: 0.0, end: 12.0),
                                                  duration: Duration(
                                                      milliseconds: 1200),
                                                  curve: Curves.easeInOut,
                                                  builder:
                                                      (context, value, child) {
                                                    return Transform.translate(
                                                      offset: Offset(
                                                          0,
                                                          -value *
                                                              (0.5 -
                                                                  0.5 *
                                                                      math.cos(DateTime.now()
                                                                              .millisecondsSinceEpoch /
                                                                          400))),
                                                      child: child,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xFFFFF3E0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0xFFFF8E53)
                                                                  .withOpacity(
                                                                      0.18),
                                                          blurRadius: 24,
                                                          spreadRadius: 2,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Icon(
                                                      Icons.menu_book_rounded,
                                                      color: Color(0xFFFF8E53),
                                                      size: 36,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 24),
                                                // Shimmer headline
                                                ShaderMask(
                                                  shaderCallback:
                                                      (Rect bounds) {
                                                    return LinearGradient(
                                                      colors: [
                                                        Color(0xFFFF8E53),
                                                        Color(0xFFFF6B6B)
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                    ).createShader(bounds);
                                                  },
                                                  child: Text(
                                                    'Loading Bible…',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      letterSpacing: 0.2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Preparing your spiritual journey…',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 22),
                                                // Accent progress bar
                                                LinearProgressIndicator(
                                                  minHeight: 5,
                                                  backgroundColor:
                                                      Color(0xFFFF8E53)
                                                          .withOpacity(0.10),
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          Color(0xFFFF8E53)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              if (bibleTexts.isEmpty) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.book_outlined,
                                          size: 48,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        t.noitemstodisplay,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Text(
                                          t.no_verse_content,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              return Padding(
                                padding: EdgeInsets.fromLTRB(20, 8, 20,
                                    MediaQuery.of(context).padding.bottom + 20),
                                child: Column(
                                  children:
                                      List.generate(bibleTexts.length, (index) {
                                    final text = bibleTexts[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              blurRadius: 8,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          border: Border(
                                            left: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.7),
                                              width: 4,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 14, 16, 14),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Verse number badge
                                              Container(
                                                width: 28,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.12),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    (index + 1).toString(),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 14),
                                              // Verse text
                                              Expanded(
                                                child: Text(
                                                  text.verseText,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    height: 1.7,
                                                    color: Colors.black87,
                                                    letterSpacing: 0.3,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Player section with enhanced decoration
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Player section with enhanced decoration
                          Selector<BibleMediaController, String>(
                            selector: (_, controller) => controller.audioUrl,
                            builder: (context, audioUrl, child) {
                              if (audioUrl.isEmpty) {
                                return SizedBox.shrink();
                              }
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: _minPlayerHeight,
                                    maxHeight: _playerHeight,
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOutCubic,
                                    height: _playerHeight,
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: AudioPlayerWidget(
                                          audioUrl: audioUrl,
                                          onNext: provider.goToNextChapter,
                                          onPrevious:
                                              provider.goToPreviousChapter,
                                          isMinimized: _isPlayerMinimized,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // SizedBox(height: 16),
                          AnimatedOpacity(
                            opacity: _isPlayerMinimized ? 0.0 : 1.0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: _isPlayerMinimized
                                ? SizedBox.shrink()
                                : Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(bottom: 16),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                            Theme.of(context)
                                                .primaryColor
                                                .withBlue(255)
                                                .withOpacity(0.1),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.2),
                                          width: 1,
                                        ),
                                      ),
                                      child:
                                          Selector<BibleMediaController, int>(
                                        selector: (_, controller) =>
                                            controller.currentChapter,
                                        builder:
                                            (context, currentChapter, child) {
                                          return Text(
                                            'Chapter $currentChapter',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              letterSpacing: 0.3,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _disposed = true;
    try {
      _bibleMediaController.audioController.stop();
      _bibleMediaController.audioController.dispose();
    } catch (_) {}
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}

class AudioPlayerWidget extends StatelessWidget {
  final String audioUrl;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool isMinimized;

  AudioPlayerWidget({
    required this.audioUrl,
    required this.onNext,
    required this.onPrevious,
    required this.isMinimized,
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
          playbackSpeed: audioController.playbackSpeed,
          onSpeedChange: (speed) => audioController.setPlaybackSpeed(speed),
          isMinimized: isMinimized,
        );
      },
    );
  }
}
