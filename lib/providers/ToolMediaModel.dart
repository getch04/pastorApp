import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';
import '../i18n/strings.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../database/SQLiteDbProvider.dart';
import 'package:http/http.dart' as http;
import '../models/Categories.dart';
import '../utils/ApiUrl.dart';
import '../models/Userdata.dart';
import '../models/Media.dart';

class ToolMediaModel with ChangeNotifier {
  //List<Comments> _items = [];
  bool isError = false;
  Userdata? userdata;
  List<Media> mediaList = [];
  List<Categories> subCategoriesList = [];
  int? category = 0;
  int selectedSubCategory = 0;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int page = 0;

  late AppStateManager appState;
  String? language;

  ToolMediaModel() {
    this.mediaList = [];
    getUserData();
  }

  getUserData() async {
    userdata = await SQLiteDbProvider.db.getUserData();
    print("userdata " + userdata.toString());
    notifyListeners();
  }

  loadItems(int? category, BuildContext ctx) {
    this.category = category;
    refreshController.requestRefresh();
    page = 0;
    appState = Provider.of(ctx, listen: false);
    language = appLanguageData[AppLanguage.values[appState.preferredLanguage]]![
        'value']!;
    fetchItems();
  }

  loadMoreItems() {
    page = page + 1;
    fetchItems();
  }

  void setItems(List<Media> item) {
    mediaList.clear();
    mediaList = item;
    refreshController.refreshCompleted();
    isError = false;
    notifyListeners();
  }

  void setMoreItems(List<Media> item) {
    mediaList.addAll(item);
    refreshController.loadComplete();
    notifyListeners();
  }

  refreshPageOnCategorySelected(int id, BuildContext ctx) {
    if (id != selectedSubCategory) {
      selectedSubCategory = id;
      notifyListeners();
      loadItems(category, ctx);
    }
  }

  Future<void> fetchItems() async {
    try {
      var data = {
        "email": userdata == null ? "null" : userdata!.email,
        "sub": selectedSubCategory.toString(),
        "category": category.toString(),
        "version": "v2",
        "page": page.toString()
      };

      final response = await http.get(
        Uri.parse(ApiUrl.GET_TOOLS + "?lang=$language"),
      );

      if (response.statusCode == 200) {
        final responseBody = response.body;

        // Directly calling parseSliderMedia without using compute
        List<Media> mediaList = parseSliderMedia(responseBody);

        if (page == 0) {
          setItems(mediaList);
        } else {
          setMoreItems(mediaList);
        }
      } else {
        setFetchError();
      }
    } catch (exception) {
      print(exception);
      setFetchError();
    }
  }

  List<Media> parseSliderMedia(String responseBody) {
    final parsed = jsonDecode(responseBody);
    final mediaItems = parsed['media'] as List<dynamic>;

    return mediaItems.map<Media>((json) {
      return Media(
        id: int.tryParse(json['id'].toString()),
        category: json['category'] as String?,
        title: json['${language}_title'] as String? ?? json['title'] as String?,
        coverPhoto: json['cover_photo'] as String?,
        mediaType: json['type'] as String?,
        videoType: json['video_type'] as String?,
        description: json['${language}_description'] as String? ??
            json['description'] as String?,
        downloadUrl: json['download'] as String?,
        canPreview: int.parse(json['can_preview'].toString()) == 1,
        canDownload: int.parse(json['can_download'].toString()) == 1,
        isFree: int.parse(json['is_free'].toString()) == 1,
        userLiked: json['user_liked'] as bool?,
        http: true,
        duration: int.tryParse(json['duration'].toString()),
        commentsCount: int.tryParse(json['comments_count'].toString()),
        likesCount: int.tryParse(json['likes_count'].toString()),
        previewDuration: int.tryParse(json['preview_duration'].toString()),
        streamUrl: json['stream'] as String?,
        viewsCount: int.tryParse(json['views_count'].toString()),
        source: json['source'] as String?,
        extraSource: json['extra_source'] as String?,
      );
    }).toList();
  }



  static List<Categories> parseCategories(String responseBody) {
    final res = jsonDecode(responseBody);
    final parsed = res["subcategories"].cast<Map<String, dynamic>>();
    return parsed
        .map<Categories>((json) => Categories.fromJson2(json))
        .toList();
  }

  setFetchError() {
    if (page == 0) {
      isError = true;
      refreshController.refreshFailed();
      notifyListeners();
    } else {
      refreshController.loadFailed();
      notifyListeners();
    }
  }
}
