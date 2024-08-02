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
  StreamSubscription<PlayerState>? _playerStateSubscription;
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

  void _initializeListeners() {
    _playerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (_disposed) return;
      _isPlaying = state == PlayerState.playing;
      _isLoading = state == false;
      notifyListeners();
    });

    _durationSubscription =
        _audioPlayer.onDurationChanged.listen((Duration duration) {
      if (_disposed) return;
      _duration = duration;
      notifyListeners();
    });

    _positionSubscription =
        _audioPlayer.onPositionChanged.listen((Duration position) {
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
      await _audioPlayer.setSourceUrl(audioUrl);
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
    _playerStateSubscription?.cancel();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
}
