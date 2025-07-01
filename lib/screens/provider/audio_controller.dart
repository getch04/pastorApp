import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioController extends ChangeNotifier {
  static AudioController? _currentlyPlaying;

  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoading = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  String? _currentAudioUrl;
  double _playbackSpeed = 1.0;
  StreamSubscription? _playerSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  bool _disposed = false;

  AudioController() {
    _audioPlayer = AudioPlayer();
    _initializeListeners();
  }

  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading;
  Duration get duration => _duration;
  Duration get position => _position;
  double get playbackSpeed => _playbackSpeed;

  void _initializeListeners() {
    _playerSubscription = _audioPlayer.onPlayerStateChanged.listen((state) {
      if (_disposed) return;
      final isPlaying = state == PlayerState.playing;
      if (_isPlaying != isPlaying) {
        _isPlaying = isPlaying;
        _isLoading = false;
        notifyListeners();
      }
    });

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      if (_disposed) return;
      _duration = duration;
      notifyListeners();
    });

    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      if (_disposed) return;
      _position = position;
      notifyListeners();
    });
  }

  Future<void> play(String audioUrl) async {
    if (_disposed) return;
    if (_currentlyPlaying != null && _currentlyPlaying != this) {
      _currentlyPlaying!.stop();
    }
    _currentlyPlaying = this;

    if (_currentAudioUrl != audioUrl) {
      _currentAudioUrl = audioUrl;
      _isLoading = true;
      notifyListeners();

      try {
        // Validate URL
        if (audioUrl.isEmpty) {
          throw Exception('Audio URL is empty');
        }

        // Check for iOS-incompatible formats
        if (audioUrl.toLowerCase().contains('.webm') ||
            audioUrl.toLowerCase().contains('opus')) {
          throw Exception(
              'This audio format (WebM/Opus) is not supported on iOS. Please try a different audio source.');
        }

        // Ensure HTTPS for iOS
        String validatedUrl = audioUrl;
        if (audioUrl.startsWith('http://')) {
          validatedUrl = audioUrl.replaceFirst('http://', 'https://');
        }

        await _audioPlayer.setSourceUrl(validatedUrl);
      } catch (e) {
        print('Audio loading error: $e');
        _isLoading = false;
        _isPlaying = false;
        notifyListeners();
        rethrow; // Re-throw to handle in UI
      }
      _isLoading = false;
    }

    try {
      await _audioPlayer.resume();
    } catch (e) {
      print('Audio resume error: $e');
      _isPlaying = false;
      notifyListeners();
    }
  }

  void pause() {
    if (_disposed) return;
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    if (_disposed) return;
    _audioPlayer.seek(position);
  }

  Future<void> stop() async {
    if (_disposed) return;
    await _audioPlayer.stop();
    _isPlaying = false;
    _position = Duration.zero;
    notifyListeners();
  }

  Future<void> setPlaybackSpeed(double speed) async {
    if (_disposed) return;
    _playbackSpeed = speed;
    await _audioPlayer.setPlaybackRate(speed);
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _playerSubscription?.cancel();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    // _audioPlayer.dispose();
    super.dispose();
  }
}
