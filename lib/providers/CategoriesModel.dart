import 'dart:async';
import 'dart:convert';

import 'package:churchapp_flutter/database/SQLiteDbProvider.dart';
import 'package:churchapp_flutter/models/SermonMedia.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/services/sermon_download_service.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/Categories.dart';
import '../models/Media.dart';
import '../utils/ApiUrl.dart';

class CategoriesModel with ChangeNotifier {
  //List<Comments> _items = [];
  bool isError = false;
  bool isLoading = false;
  List<Categories>? categories;
  Map<int, List<Media>> _categoryMedia = {};
  Map<int, IndividualSermonDownloadService> _downloadServices = {};
  Map<int, double> _downloadProgress = {};
  Map<int, String> _downloadStatus = {};
  AppStateManager appManager;
  int _totalSavedSermons = 0;

  int get totalSavedSermons => _totalSavedSermons;
  Map<int, double> get downloadProgress => _downloadProgress;
  Map<int, String> get downloadStatus => _downloadStatus;

  CategoriesModel(this.appManager) {
    loadItems();
  }

  loadItems() {
    isLoading = true;
    notifyListeners();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      // Get total saved sermons count
      _totalSavedSermons = await SQLiteDbProvider.db.getTotalSavedSermons();

      // Load downloaded sermons to populate the _categoryMedia map
      final savedSermons = await SQLiteDbProvider.db.getDownloadedSermons();

      // Always populate the _categoryMedia map with downloaded sermons
      for (var sermon in savedSermons) {
        _categoryMedia[sermon.id] = [
          Media(
            id: sermon.id,
            title: sermon.title,
            description: sermon.description,
            downloadUrl: sermon.downloadUrl,
            streamUrl: sermon.streamUrl,
            category: sermon.category,
            coverPhoto: sermon.coverPhoto,
            mediaType: sermon.mediaType,
            // Default values for required fields
            canPreview: true,
            canDownload: true,
            isFree: true,
            http: true,
          )
        ];
      }

      print('📱 Found ${savedSermons.length} saved sermons locally');
      print('🌐 Fetching online sermons from remote...');

      // Always fetch from remote for online tab
      await fetchItems();
    } catch (e) {
      print('❌ Error loading categories: $e');
      await fetchItems(); // Fallback to remote if local fails
    }
  }

  Future<void> fetchItems() async {
    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';
    try {
      final dio = Dio();
      print('🌐 Fetching categories from remote API...');
      final response = await dio.get(
        ApiUrl.CATEGORIES + "?lang=$language",
      );

      if (response.statusCode == 200) {
        isLoading = false;
        isError = false;

        dynamic res = jsonDecode(response.data);
        categories = parseCategories(res);
        print(
            '✅ Successfully fetched ${categories?.length ?? 0} categories from remote');
        notifyListeners();
      } else {
        setFetchError();
      }
    } catch (exception) {
      print('❌ Error fetching from remote: $exception');
      setFetchError();
    }
  }

  static List<Categories>? parseCategories(dynamic res) {
    final parsed = res["categories"].cast<Map<String, dynamic>>();
    return parsed.map<Categories>((json) => Categories.fromJson(json)).toList();
  }

  setFetchError() {
    isError = true;
    isLoading = false;
    notifyListeners();
  }

  List<Media>? getCategoryMedia(int? categoryId) {
    if (categoryId == null) return null;
    return _categoryMedia[categoryId];
  }

  Future<List<Media>?> getMediaByCategory(int? categoryId) async {
    if (categoryId == null) return null;

    // First check if we have this media in local storage
    final localMedia = _categoryMedia[categoryId];
    if (localMedia != null) {
      print('📱 Found media for category $categoryId in local cache');
      return localMedia;
    }

    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';

    try {
      print('🌐 Fetching media for category $categoryId from remote...');
      final dio = Dio();
      final response = await dio.get(
        '${ApiUrl.FETCH_CATEGORIES_MEDIA}/$categoryId?lang=$language',
      );

      if (response.statusCode == 200) {
        dynamic res = jsonDecode(response.data);
        final parsed = res["media"].cast<Map<String, dynamic>>();
        final media =
            parsed.map<Media>((json) => Media.fromJson(json)).toList();
        _categoryMedia[categoryId] = media;
        print(
            '✅ Successfully fetched ${media.length} media items for category $categoryId');
        return media;
      }
    } catch (e) {
      print('❌ Error fetching media for category $categoryId: $e');
    }
    return null;
  }

  Future<void> startIndividualDownload(Categories category) async {
    if (_downloadServices.containsKey(category.id)) {
      // Already downloading
      return;
    }

    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';

    // Create SermonMedia from category
    SermonMedia sermon = SermonMedia(
      id: category.id ?? 0,
      title: category.title,
      coverPhoto: category.thumbnailUrl,
      mediaType: 'audio',
      category: category.title,
      downloadStatus: 'pending',
      downloadProgress: 0,
    );

    // Create download service
    IndividualSermonDownloadService downloadService =
        IndividualSermonDownloadService(
      sermon: sermon,
      language: language,
      onProgressUpdate: (status, data) {
        _handleDownloadProgress(category.id ?? 0, status, data);
      },
    );

    _downloadServices[category.id ?? 0] = downloadService;
    _downloadStatus[category.id ?? 0] = 'downloading';
    _downloadProgress[category.id ?? 0] = 0.0;
    notifyListeners();

    // Start download
    await downloadService.startDownload();
  }

  void _handleDownloadProgress(int categoryId, String status, dynamic data) {
    switch (status) {
      case IndividualSermonDownloadService.DOWNLOAD_PROGRESS:
        _downloadProgress[categoryId] = data as double;
        _downloadStatus[categoryId] = 'downloading';
        break;
      case IndividualSermonDownloadService.DOWNLOAD_COMPLETED:
        _downloadProgress[categoryId] = 1.0;
        _downloadStatus[categoryId] = 'completed';
        _downloadServices.remove(categoryId);
        _totalSavedSermons++;
        _refreshDownloadedSermons(); // Refresh downloaded sermons
        break;
      case IndividualSermonDownloadService.DOWNLOAD_ERROR:
        _downloadStatus[categoryId] = 'failed';
        _downloadServices.remove(categoryId);
        _downloadProgress.remove(categoryId);
        break;
      case IndividualSermonDownloadService.DOWNLOAD_CANCELLED:
        _downloadStatus[categoryId] = 'cancelled';
        _downloadServices.remove(categoryId);
        _downloadProgress.remove(categoryId);
        break;
    }
    notifyListeners();
  }

  void cancelIndividualDownload(int categoryId) {
    final downloadService = _downloadServices[categoryId];
    if (downloadService != null) {
      downloadService.cancelDownload();
      _downloadServices.remove(categoryId);
      _downloadProgress.remove(categoryId);
      _downloadStatus.remove(categoryId);
      notifyListeners();
    }
  }

  Future<void> deleteIndividualSermon(
      int categoryId, BuildContext context) async {
    try {
      bool success = await SQLiteDbProvider.db.deleteSermon(categoryId);
      if (success) {
        _totalSavedSermons--;
        _refreshDownloadedSermons(); // Refresh to reflect the deletion
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sermon deleted successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete sermon')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting sermon: $e')),
      );
    }
  }

  Future<void> deleteAllSermons(BuildContext context) async {
    try {
      // Show confirmation dialog
      bool? confirm = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete All Sermons'),
            content: Text(
                'Are you sure you want to delete all downloaded sermons? This action cannot be undone.'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text('Delete All', style: TextStyle(color: Colors.red)),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        isLoading = true;
        notifyListeners();

        bool success = await SQLiteDbProvider.db.deleteAllSermons();
        if (success) {
          // Clear local data
          categories = null;
          _categoryMedia.clear();
          _totalSavedSermons = 0;

          // Fetch remote data
          await fetchItems();

          // Show success message
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('All sermons deleted successfully')),
            );
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to delete sermons')),
            );
          }
        }
      }
    } catch (e) {
      print('❌ Error deleting all sermons: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting sermons: $e')),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _refreshDownloadedSermons() async {
    try {
      final savedSermons = await SQLiteDbProvider.db.getDownloadedSermons();
      _totalSavedSermons = savedSermons.length;

      // Update the _categoryMedia map with downloaded sermons
      for (var sermon in savedSermons) {
        _categoryMedia[sermon.id] = [
          Media(
            id: sermon.id,
            title: sermon.title,
            description: sermon.description,
            downloadUrl: sermon.downloadUrl,
            streamUrl: sermon.streamUrl,
            category: sermon.category,
            coverPhoto: sermon.coverPhoto,
            mediaType: sermon.mediaType,
            // Default values for required fields
            canPreview: true,
            canDownload: true,
            isFree: true,
            http: true,
          )
        ];
      }

      notifyListeners();
    } catch (e) {
      print('❌ Error refreshing downloaded sermons: $e');
    }
  }

  bool isSermonDownloaded(int categoryId) {
    return _categoryMedia.containsKey(categoryId);
  }

  double getDownloadProgress(int categoryId) {
    return _downloadProgress[categoryId] ?? 0.0;
  }

  String getDownloadStatus(int categoryId) {
    return _downloadStatus[categoryId] ?? 'pending';
  }

  bool isDownloading(int categoryId) {
    return _downloadServices.containsKey(categoryId);
  }

  // Get downloaded sermons as Categories for the downloaded tab
  Future<List<Categories>> getDownloadedCategories() async {
    try {
      final savedSermons = await SQLiteDbProvider.db.getDownloadedSermons();
      return savedSermons
          .map((sermon) => Categories(
                id: sermon.id,
                title: sermon.title,
                thumbnailUrl: sermon.coverPhoto,
                mediaCount: 1,
              ))
          .toList();
    } catch (e) {
      print('❌ Error getting downloaded categories: $e');
      return [];
    }
  }
}
