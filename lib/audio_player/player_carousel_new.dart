import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerNew extends StatefulWidget {
  final String audioUrl;
  final bool showTableOfContent;

  PlayerNew({required this.audioUrl, this.showTableOfContent = true});

  @override
  _PlayerNewState createState() => _PlayerNewState();
}

class _PlayerNewState extends State<PlayerNew> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initializePlayer();

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });
  }

  Future<void> _initializePlayer() async {
    try {
      if (widget.audioUrl.isNotEmpty) {
        await _audioPlayer.setSourceUrl(widget.audioUrl);
        await _audioPlayer.resume();
      }
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  void _playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
  }

  void _skipPrevious() {
    _audioPlayer.seek(Duration.zero);
  }

  void _skipNext() {
    _audioPlayer.seek(Duration.zero);
  }

  void _shuffle() {
    // Implement shuffle logic if needed
  }

  void _repeat() {
    // Implement repeat logic if needed
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return [
      if (hours > 0) twoDigits(hours),
      twoDigits(minutes),
      twoDigits(seconds)
    ].join(':');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  List<Widget> _controllers(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Slider(
              activeColor: Colors.orange,
              inactiveColor: Colors.grey,
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  _audioPlayer.seek(Duration(seconds: value.toInt()));
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(_position),
                    style: TextStyle(),
                  ),
                  Text(
                    _formatDuration(_duration),
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _playerIcon(
                  icon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.shuffle,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  onPress: _shuffle,
                ),
                _playerIcon(
                  icon: Icon(
                    Icons.skip_previous,
                    size: 45.0,
                    color: Colors.white,
                  ),
                  onPress: _skipPrevious,
                ),
                _playerIcon(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  onPress: _playPause,
                ),
                _playerIcon(
                  icon: Icon(
                    Icons.skip_next,
                    size: 45.0,
                    color: Colors.white,
                  ),
                  onPress: _skipNext,
                ),
                _playerIcon(
                  icon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.refresh,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  onPress: _repeat,
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _controllers(context),
    );
  }
}

class _playerIcon extends StatelessWidget {
  const _playerIcon({
    required this.onPress,
    required this.icon,
  });

  final VoidCallback onPress;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 255, 102, 0),
            Colors.orange,
          ]),
        ),
        child: icon,
      ),
    );
  }
}
