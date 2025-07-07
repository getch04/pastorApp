import 'dart:async';
import 'dart:convert';

import 'package:churchapp_flutter/database/SQLiteDbProvider.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
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
  AppStateManager appManager;
  int _totalSavedSermons = 0;

  int get totalSavedSermons => _totalSavedSermons;

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

      // First try to load saved sermons from local database
      final savedSermons = await SQLiteDbProvider.db.getDownloadedSermons();

      if (savedSermons.isNotEmpty) {
        print('📱 Found ${savedSermons.length} saved sermons locally');
        // Convert SermonMedia to Categories
        categories = savedSermons
            .map((sermon) => Categories(
                  id: sermon.id,
                  title: sermon.title,
                  thumbnailUrl: sermon.coverPhoto,
                  mediaCount: 1,
                ))
            .toList();

        // Also populate the _categoryMedia map with the saved sermons
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

        isLoading = false;
        isError = false;
        notifyListeners();
      } else {
        print('🌐 No local sermons found, fetching from remote...');
        await fetchItems();
      }
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
}
