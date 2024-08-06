import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioController2 extends ChangeNotifier {
  static AudioController2? _currentlyPlaying;

  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoading = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  String? _currentAudioUrl;
  StreamSubscription? _playerSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  bool _disposed = false;

  AudioController2() {
    _audioPlayer = AudioPlayer();
    _initializeListeners();
  }

  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading;
  Duration get duration => _duration;
  Duration get position => _position;

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
        await _audioPlayer.setSourceUrl(audioUrl);
      } catch (e) {
        _isLoading = false;
        notifyListeners();
        // Handle error
      }
      _isLoading = false;
    }
    await _audioPlayer.resume();
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

  @override
  void dispose() {
    _disposed = true;
    _playerSubscription?.cancel();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
}
