import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/language_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BibleBooksProvider with ChangeNotifier {
  //ENGESV
  List<BibleBook> oldTestamentBooks = [];
  List<BibleBook> newTestamentBooks = [];
  bool isLoading = false;

  Future<void> fetchBooks(BibleVersion? v) async {
    isLoading = true;
    notifyListeners();

    final url =
        '$BIBLE_BASE_URL/bibles/ENGESV/book?v=4&language_code=17045&key=$BIBLE_API_KEY';

    final urlWithSelected =
        '$BIBLE_BASE_URL/bibles/${v?.abbr}/book?v=4&language_code=${v?.languageId}&key=$BIBLE_API_KEY';

    final finalUrl = v == null ? url : urlWithSelected;
    try {
      final response = await http.get(Uri.parse(finalUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        final books = data.map((json) => BibleBook.fromJson(json)).toList();

        oldTestamentBooks =
            books.where((book) => book.testament == 'OT').toList();
        newTestamentBooks =
            books.where((book) => book.testament == 'NT').toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
