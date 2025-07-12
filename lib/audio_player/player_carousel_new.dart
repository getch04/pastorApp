import 'dart:io';

import 'package:churchapp_flutter/utils/Utility.dart';
import 'package:flutter/material.dart';

class PlayerNew extends StatefulWidget {
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

  @override
  _PlayerNewState createState() => _PlayerNewState();
}

class _PlayerNewState extends State<PlayerNew> {
  bool _isValidUrl = false;
  bool _isCheckingUrl = true;
  String? _lastCheckedUrl;

  @override
  void initState() {
    super.initState();
    _validateUrl();
  }

  @override
  void didUpdateWidget(PlayerNew oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only revalidate if the URL has changed
    if (widget.audioUrl != oldWidget.audioUrl) {
      _validateUrl();
    }
  }

  Future<void> _validateUrl() async {
    // Don't revalidate the same URL
    if (_lastCheckedUrl == widget.audioUrl && !_isCheckingUrl) {
      return;
    }

    setState(() {
      _isCheckingUrl = true;
      _lastCheckedUrl = widget.audioUrl;
    });

    try {
      bool isValid = false;

      if (widget.audioUrl.isEmpty) {
        isValid = false;
      } else if (widget.isOffline) {
        // For local files, reconstruct the path and check if it exists
        final correctPath = await Utility.getCorrectLocalPath(widget.audioUrl);
        isValid = File(correctPath).existsSync();
      } else {
        // For remote URLs, check if it's a valid URI
        isValid = Uri.tryParse(widget.audioUrl)?.hasAbsolutePath ?? false;
      }

      if (mounted) {
        setState(() {
          _isValidUrl = isValid;
          _isCheckingUrl = false;
        });
      }
    } catch (e) {
      print('Error validating URL: $e');
      if (mounted) {
        setState(() {
          _isValidUrl = false;
          _isCheckingUrl = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: widget.isMinimized ? 4 : 12,
      ),
      height: widget.isMinimized ? 52 : 230,
      decoration: BoxDecoration(
        gradient: widget.isMinimized ? null : null,
        color: widget.isMinimized
            ? Colors.white.withOpacity(0.92)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        boxShadow: widget.isMinimized
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
          if (_isCheckingUrl)
            Container(
              height: widget.isMinimized ? 52 : 190,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (!_isValidUrl)
            Container(
              height: widget.isMinimized ? 52 : 190,
              decoration: BoxDecoration(
                color: widget.isMinimized
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
                    if (widget.isOffline)
                      Text(
                        'File path may have changed',
                        style: TextStyle(
                          color: Colors.red.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          if (!widget.isMinimized && _isValidUrl)
            ClipRect(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOut,
                opacity: widget.isMinimized ? 0 : 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Speed Control with Glassmorphism effect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!widget.isMinimized && widget.isOffline)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.green.withOpacity(0.3)),
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
                                        color:
                                            Color(0xFFFF8E53).withOpacity(0.10),
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
                                        '${widget.playbackSpeed}x',
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
                                onSelected: widget.onSpeedChange,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${speed}x',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: speed ==
                                                            widget.playbackSpeed
                                                        ? Color(0xFFFF6B6B)
                                                        : Colors.black87,
                                                    fontWeight: speed ==
                                                            widget.playbackSpeed
                                                        ? FontWeight.w600
                                                        : FontWeight.normal,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                                if (speed ==
                                                    widget.playbackSpeed)
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
                      ],
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
                          max: widget.duration.inSeconds.toDouble(),
                          value: widget.position.inSeconds.toDouble(),
                          onChanged: (value) =>
                              widget.onSeek(Duration(seconds: value.toInt())),
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
                            _formatDuration(widget.position),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _formatDuration(widget.duration),
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
          if (_isValidUrl)
            Container(
              height: widget.isMinimized ? 44 : 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCircleButton(
                      icon: Icons.skip_previous_rounded,
                      onTap: widget.onPrevious,
                      size: widget.isMinimized ? 42 : 50),
                  _buildCircleButton(
                    icon: widget.isPlaying
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    onTap: widget.isPlaying ? widget.onPause : widget.onPlay,
                    size: widget.isMinimized ? 68 : 86,
                    isMain: true,
                    isLoading: widget.isLoading,
                  ),
                  _buildCircleButton(
                      icon: Icons.skip_next_rounded,
                      onTap: widget.onNext,
                      size: widget.isMinimized ? 42 : 50),
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
