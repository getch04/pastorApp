import 'dart:async';
import 'dart:convert';

import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/Categories.dart';
import '../utils/ApiUrl.dart';

class CategoriesModel with ChangeNotifier {
  //List<Comments> _items = [];
  bool isError = false;
  bool isLoading = false;
  List<Categories>? categories;
  AppStateManager appManager;

  CategoriesModel(this.appManager) {
    loadItems();
  }

  loadItems() {
    isLoading = true;
    notifyListeners();
    fetchItems();
  }

  Future<void> fetchItems() async {
    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';
    try {
      final dio = Dio();

      final response = await dio.get(
        ApiUrl.CATEGORIES + "?lang=$language",
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        isLoading = false;
        isError = false;

        dynamic res = jsonDecode(response.data);
        categories = parseCategories(res);
        notifyListeners();
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setFetchError();
      }
    } catch (exception) {
      // I get no exception here
      print(exception);
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
}
