import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BibleBooksProvider with ChangeNotifier {
  List<BibleBook> oldTestamentBooks = [];
  List<BibleBook> newTestamentBooks = [];
  bool isLoading = false;

  Future<void> fetchBooks(String selectedBible) async {
    isLoading = true;
    notifyListeners();

    final url = '$BIBLE_BASE_URL/bibles/$selectedBible/book?v=4&key=$BIBLE_API_KEY';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        final books = data.map((json) => BibleBook.fromJson(json)).toList();

        oldTestamentBooks = books.where((book) => book.testament == 'OT').toList();
        newTestamentBooks = books.where((book) => book.testament == 'NT').toList();
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
