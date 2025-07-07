import 'dart:io';

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
  final Function(double)? onSpeedChange;
  final double playbackSpeed;
  final bool isMinimized;
  final bool isOffline;

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
    this.onSpeedChange,
    this.playbackSpeed = 1.0,
    this.isMinimized = false,
  }) : isOffline = audioUrl.startsWith('/');

  bool get isValidUrl =>
      audioUrl.isNotEmpty &&
      (isOffline
          ? File(audioUrl).existsSync()
          : Uri.tryParse(audioUrl)?.hasAbsolutePath ?? false);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: isMinimized ? 4 : 12,
      ),
      height: isMinimized ? 52 : 230,
      decoration: BoxDecoration(
        gradient: isMinimized ? null : null,
        color:
            isMinimized ? Colors.white.withOpacity(0.92) : Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        boxShadow: isMinimized
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isMinimized && isOffline)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.offline_pin_rounded,
                            size: 16, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          'Playing Offline',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (!isValidUrl)
            Container(
              height: isMinimized ? 52 : 190,
              decoration: BoxDecoration(
                color: isMinimized
                    ? Colors.white.withOpacity(0.92)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 24),
                    SizedBox(height: 8),
                    Text(
                      'Audio file not available',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (!isMinimized)
            ClipRect(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOut,
                opacity: isMinimized ? 0 : 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Speed Control with Glassmorphism effect
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 32,
                        margin: EdgeInsets.only(bottom: 8),
                        child: Material(
                          color: Colors.transparent,
                          child: PopupMenuButton<double>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            position: PopupMenuPosition.under,
                            offset: Offset(0, 8),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xFFFF8E53).withOpacity(0.7),
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFF8E53).withOpacity(0.10),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.speed,
                                      color: Color(0xFFFF8E53), size: 16),
                                  SizedBox(width: 6),
                                  Text(
                                    '${playbackSpeed}x',
                                    style: TextStyle(
                                      color: Color(0xFFFF8E53),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onSelected: onSpeedChange,
                            itemBuilder: (context) => [
                              0.5,
                              0.75,
                              1.0,
                              1.25,
                              1.5,
                              2.0
                            ]
                                .map((speed) => PopupMenuItem<double>(
                                      value: speed,
                                      height: 44,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${speed}x',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: speed == playbackSpeed
                                                    ? Color(0xFFFF6B6B)
                                                    : Colors.black87,
                                                fontWeight:
                                                    speed == playbackSpeed
                                                        ? FontWeight.w600
                                                        : FontWeight.normal,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            if (speed == playbackSpeed)
                                              Container(
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFF6B6B)
                                                      .withOpacity(0.1),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFFFF6B6B),
                                                  size: 14,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),

                    // Modern Progress Bar
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 5,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 8),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 16),
                          activeTrackColor: Color(0xFFFF8E53),
                          inactiveTrackColor:
                              Color(0xFFFF8E53).withOpacity(0.3),
                          thumbColor: Color(0xFFFF8E53),
                          overlayColor: Color(0xFFFF8E53).withOpacity(0.2),
                        ),
                        child: Slider(
                          min: 0.0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) =>
                              onSeek(Duration(seconds: value.toInt())),
                        ),
                      ),
                    ),

                    // Time indicators
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(position),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _formatDuration(duration),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Enhanced Control Buttons
          Container(
            height: isMinimized ? 44 : 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCircleButton(
                    icon: Icons.skip_previous_rounded,
                    onTap: onPrevious,
                    size: isMinimized ? 42 : 50),
                _buildCircleButton(
                  icon: isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  onTap: isPlaying ? onPause : onPlay,
                  size: isMinimized ? 68 : 86,
                  isMain: true,
                  isLoading: isLoading,
                ),
                _buildCircleButton(
                    icon: Icons.skip_next_rounded,
                    onTap: onNext,
                    size: isMinimized ? 42 : 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
    required double size,
    bool isMain = false,
    bool isLoading = false,
  }) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xFFFF8E53),
        shape: BoxShape.circle,
        boxShadow: isMain
            ? [
                BoxShadow(
                  color: Color(0xFFFF8E53).withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: onTap,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: size * 0.5,
                    height: size * 0.5,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2.5,
                    ),
                  )
                : Icon(
                    icon,
                    color: Colors.white,
                    size: isMain ? size * 0.6 : size * 0.55,
                  ),
          ),
        ),
      ),
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
