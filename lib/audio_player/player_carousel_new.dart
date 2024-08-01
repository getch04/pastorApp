import 'package:flutter/material.dart';

class PlayerNew extends StatelessWidget {
  final String audioUrl;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool isPlaying;
  final bool isLoading;
  final Duration duration;
  final Duration position;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final Function(Duration) onSeek;

  PlayerNew({
    required this.audioUrl,
    required this.onNext,
    required this.onPrevious,
    required this.isPlaying,
    required this.isLoading,
    required this.duration,
    required this.position,
    required this.onPlay,
    required this.onPause,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              Slider(
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
                min: 0.0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (double value) {
                  onSeek(Duration(seconds: value.toInt()));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(position),
                      style: TextStyle(),
                    ),
                    Text(
                      _formatDuration(duration),
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
                    onPress: () {},
                  ),
                  _playerIcon(
                    icon: Icon(
                      Icons.skip_previous,
                      size: 45.0,
                      color: Colors.white,
                    ),
                    onPress: onPrevious,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isLoading)
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      _playerIcon(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 60.0,
                          color: Colors.white,
                        ),
                        onPress: isPlaying ? onPause : onPlay,
                      ),
                    ],
                  ),
                  _playerIcon(
                    icon: Icon(
                      Icons.skip_next,
                      size: 45.0,
                      color: Colors.white,
                    ),
                    onPress: onNext,
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
                    onPress: () {}, // Implement repeat logic if needed
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
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
