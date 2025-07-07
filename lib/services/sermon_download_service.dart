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
