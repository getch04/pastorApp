import 'dart:convert';
import 'dart:io';

import 'package:churchapp_flutter/database/SQLiteDbProvider.dart';
import 'package:churchapp_flutter/models/SermonMedia.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class SermonDownloadService {
  static const String DOWNLOAD_PROGRESS = 'progress';
  static const String DOWNLOAD_COMPLETED = 'completed';
  static const String DOWNLOAD_ERROR = 'error';

  final List<SermonMedia> sermons;
  final String language;
  final Function(String, dynamic)? onProgressUpdate;
  bool _isCancelled = false;
  final Dio _dio = Dio();

  SermonDownloadService({
    required this.sermons,
    required this.language,
    this.onProgressUpdate,
  });

  Future<String> _getAudioDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final audioDir = Directory('${appDir.path}/sermon_audio');
    if (!await audioDir.exists()) {
      await audioDir.create(recursive: true);
    }
    return audioDir.path;
  }

  Future<String?> _downloadAudioFile(
      String url, int sermonId, String type) async {
    try {
      final audioDir = await _getAudioDirectory();
      final fileName =
          '${sermonId}_${type}_${DateTime.now().millisecondsSinceEpoch}.mp3';
      final filePath = path.join(audioDir, fileName);

      print('⬇️ Downloading $type audio to: $filePath');

      await _dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = received / total;
            onProgressUpdate?.call(DOWNLOAD_PROGRESS, progress);
          }
        },
      );

      print('✅ Successfully downloaded $type audio');
      return filePath;
    } catch (e) {
      print('❌ Error downloading $type audio: $e');
      return null;
    }
  }

  Future<void> startDownload() async {
    int totalSermons = sermons.length;
    int currentSermon = 0;

    for (var sermon in sermons) {
      if (_isCancelled) break;

      try {
        print('🔄 Processing sermon: ${sermon.title}');

        // Fetch sermon details from API
        final response = await _dio.get(
          ApiUrl.CATEGORY_AUDIO + '${sermon.id}?lang=$language',
        );
        final data = jsonDecode(response.data);

        if (data['audio'] != null) {
          final streamUrl = data['audio']['stream'] as String?;
          final worshipUrl = data['audio']['worship_stream'] as String?;
          final description = data['audio']['description'] as String?;

          String? sermonFilePath;
          String? worshipFilePath;

          // Download sermon audio
          if (streamUrl != null) {
            sermonFilePath =
                await _downloadAudioFile(streamUrl, sermon.id, 'sermon');
          }

          // Download worship audio if available
          if (worshipUrl != null) {
            worshipFilePath =
                await _downloadAudioFile(worshipUrl, sermon.id, 'worship');
          }

          // Only save to database if at least sermon audio was downloaded
          if (sermonFilePath != null) {
            sermon.description = description;
            sermon.streamUrl = sermonFilePath;
            sermon.worshipStreamUrl = worshipFilePath;
            sermon.isDownloaded = true;
            sermon.downloadStatus = 'completed';
            sermon.localPath = sermonFilePath;

            final success = await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
            if (success) {
              print('✅ Saved sermon to database: ${sermon.title}');
            } else {
              print('❌ Failed to save sermon to database: ${sermon.title}');
            }
          }
        }

        currentSermon++;
        final progress = currentSermon / totalSermons;
        onProgressUpdate?.call(DOWNLOAD_PROGRESS, progress);
      } catch (e) {
        print('❌ Error processing sermon: ${sermon.title} - $e');
        continue;
      }
    }

    if (!_isCancelled) {
      onProgressUpdate?.call(DOWNLOAD_COMPLETED, null);
    }
  }

  void cancelDownload() {
    _isCancelled = true;
  }

  Future<void> deleteDownloadedFiles() async {
    try {
      final audioDir = await _getAudioDirectory();
      final directory = Directory(audioDir);
      if (await directory.exists()) {
        await directory.delete(recursive: true);
        print('🗑️ Deleted all downloaded audio files');
      }
    } catch (e) {
      print('❌ Error deleting downloaded files: $e');
    }
  }
}

// New class for individual sermon downloads
class IndividualSermonDownloadService {
  static const String DOWNLOAD_PROGRESS = 'progress';
  static const String DOWNLOAD_COMPLETED = 'completed';
  static const String DOWNLOAD_ERROR = 'error';
  static const String DOWNLOAD_CANCELLED = 'cancelled';

  final SermonMedia sermon;
  final String language;
  final Function(String, dynamic)? onProgressUpdate;
  bool _isCancelled = false;
  final Dio _dio = Dio();
  CancelToken? _cancelToken;

  IndividualSermonDownloadService({
    required this.sermon,
    required this.language,
    this.onProgressUpdate,
  });

  Future<String> _getAudioDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final audioDir = Directory('${appDir.path}/sermon_audio');
    if (!await audioDir.exists()) {
      await audioDir.create(recursive: true);
    }
    return audioDir.path;
  }

  Future<String?> _downloadAudioFile(
      String url, int sermonId, String type) async {
    try {
      final audioDir = await _getAudioDirectory();
      final fileName =
          '${sermonId}_${type}_${DateTime.now().millisecondsSinceEpoch}.mp3';
      final filePath = path.join(audioDir, fileName);

      print('⬇️ Downloading $type audio to: $filePath');

      _cancelToken = CancelToken();
      await _dio.download(
        url,
        filePath,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = received / total;
            onProgressUpdate?.call(DOWNLOAD_PROGRESS, progress);
          }
        },
      );

      print('✅ Successfully downloaded $type audio');
      return filePath;
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
        print('📦 Download cancelled for $type audio');
        return null;
      }
      print('❌ Error downloading $type audio: $e');
      return null;
    }
  }

  Future<void> startDownload() async {
    if (_isCancelled) return;

    try {
      print('🔄 Processing sermon: ${sermon.title}');

      // Update status to downloading
      sermon.downloadStatus = 'downloading';
      sermon.downloadProgress = 0;
      await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
      onProgressUpdate?.call(DOWNLOAD_PROGRESS, 0.0);

      // Fetch sermon details from API
      final response = await _dio.get(
        ApiUrl.CATEGORY_AUDIO + '${sermon.id}?lang=$language',
        cancelToken: _cancelToken,
      );
      final data = jsonDecode(response.data);

      if (_isCancelled) {
        onProgressUpdate?.call(DOWNLOAD_CANCELLED, null);
        return;
      }

      if (data['audio'] != null) {
        final streamUrl = data['audio']['stream'] as String?;
        final worshipUrl = data['audio']['worship_stream'] as String?;
        final description = data['audio']['description'] as String?;

        String? sermonFilePath;
        String? worshipFilePath;

        // Download sermon audio
        if (streamUrl != null && !_isCancelled) {
          sermonFilePath =
              await _downloadAudioFile(streamUrl, sermon.id, 'sermon');
        }

        // Download worship audio if available
        if (worshipUrl != null && !_isCancelled) {
          worshipFilePath =
              await _downloadAudioFile(worshipUrl, sermon.id, 'worship');
        }

        if (_isCancelled) {
          // Clean up any partially downloaded files
          if (sermonFilePath != null) {
            try {
              await File(sermonFilePath).delete();
            } catch (e) {
              print('Error deleting partial file: $e');
            }
          }
          if (worshipFilePath != null) {
            try {
              await File(worshipFilePath).delete();
            } catch (e) {
              print('Error deleting partial file: $e');
            }
          }
          sermon.downloadStatus = 'pending';
          sermon.downloadProgress = 0;
          await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
          onProgressUpdate?.call(DOWNLOAD_CANCELLED, null);
          return;
        }

        // Only save to database if at least sermon audio was downloaded
        if (sermonFilePath != null) {
          sermon.description = description;
          sermon.streamUrl = sermonFilePath;
          sermon.worshipStreamUrl = worshipFilePath;
          sermon.isDownloaded = true;
          sermon.downloadStatus = 'completed';
          sermon.downloadProgress = 100;
          sermon.localPath = sermonFilePath;

          final success = await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
          if (success) {
            print('✅ Saved sermon to database: ${sermon.title}');
            onProgressUpdate?.call(DOWNLOAD_COMPLETED, null);
          } else {
            print('❌ Failed to save sermon to database: ${sermon.title}');
            sermon.downloadStatus = 'failed';
            await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
            onProgressUpdate?.call(
                DOWNLOAD_ERROR, 'Failed to save to database');
          }
        } else {
          sermon.downloadStatus = 'failed';
          await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
          onProgressUpdate?.call(DOWNLOAD_ERROR, 'Failed to download audio');
        }
      } else {
        sermon.downloadStatus = 'failed';
        await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
        onProgressUpdate?.call(DOWNLOAD_ERROR, 'No audio available');
      }
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
        sermon.downloadStatus = 'pending';
        sermon.downloadProgress = 0;
        await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
        onProgressUpdate?.call(DOWNLOAD_CANCELLED, null);
      } else {
        print('❌ Error processing sermon: ${sermon.title} - $e');
        sermon.downloadStatus = 'failed';
        await SQLiteDbProvider.db.addOrUpdateSermon(sermon);
        onProgressUpdate?.call(DOWNLOAD_ERROR, e.toString());
      }
    }
  }

  void cancelDownload() {
    _isCancelled = true;
    _cancelToken?.cancel('Download cancelled by user');
  }
}
