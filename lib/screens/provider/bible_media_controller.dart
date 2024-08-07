import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/bible_file_response.dart';
import 'package:churchapp_flutter/models/models/bible_text_response.dart';
import 'package:churchapp_flutter/models/models/language_detail.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'audio_controller.dart';

class BibleMediaController extends ChangeNotifier {
  List<BibleText> bibleTexts = [];
  String audioUrl = '';
  bool isLoading = true;
  int currentChapter = 1;
  int maxChapter = 1;
  String audiofileSetId = '';
  String textfileSetId = '';
  // BibleData? bibleData;
  BibleVersion? bibleVersion;
  BibleBook? bibleBook;
  late AudioController audioController;

  //set current chapter
  void initData(
      int chapter, BibleFilterProvider prov, BibleBook book, int max) {
    currentChapter = chapter;
    bibleVersion = prov.bibleVersion;
    bibleBook = book;
    maxChapter = max;
    audiofileSetId = bibleVersion?.getAudioFilesetId(prov.selectedType) ?? '';
    textfileSetId = bibleVersion?.getTextFilesetId(prov.selectedType) ?? '';
    fetchBibleContent();
  }

  BibleMediaController(this.audioController);

  // Future<BibleData> fetchBibleByName() async {
  //   final response = await http.get(
  //     Uri.parse(
  //         'https://4.dbt.io/api/bibles?language_code=ENG&page=1&limit=1&version=KJV&v=4'),
  //     headers: {
  //       'key': BIBLE_API_KEY,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body);
  //     final res = BibleApiResponse.fromJson(data);
  //     return res.data.first;
  //   } else {
  //     throw Exception('Failed to fetch Bible');
  //   }
  // }

  Future<void> fetchBibleContent() async {
    isLoading = true;
    notifyListeners();

    try {
      await audioController.stop();

      await Future.wait([
        fetchBibleAudioByVerse(audiofileSetId, currentChapter),
        fetchBibleTextByVerse(textfileSetId, currentChapter),
      ]);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> goToNextChapter() async {
    if (maxChapter > currentChapter) {
      currentChapter++;
      await fetchBibleContent();
    }
  }

  Future<void> goToPreviousChapter() async {
    if (currentChapter > 1) {
      currentChapter--;
      await fetchBibleContent();
    }
  }

  Future<void> fetchBibleAudioByVerse(
      String textAudiosetId, int chapter) async {
    final URL =
        'https://4.dbt.io/api/bibles/filesets/$textAudiosetId/${bibleBook?.bookId ?? ''}/$chapter?v=4';
    final response = await http.get(
      Uri.parse(URL),
      headers: {
        'key': BIBLE_API_KEY,
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['data'].isNotEmpty) {
        audioUrl = BibleFileResponse.fromJson(data).data.first.path ?? '';
      } else {
        throw Exception('No Bible text found');
      }
    } else {
      throw Exception('Failed to load Bible audio');
    }
  }

  Future<void> fetchBibleTextByVerse(String textFilesetId, int chapter) async {
    final URL =
        'https://4.dbt.io/api/bibles/filesets/$textFilesetId/${bibleBook?.bookId ?? ''}/$chapter?v=4';
    final response = await http.get(
      Uri.parse(URL),
      headers: {
        'key': BIBLE_API_KEY,
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['data'].isNotEmpty) {
        bibleTexts = BibleTextData.fromJson(data).data;
      } else {
        throw Exception('No Bible text found');
      }
    } else {
      throw Exception('Failed to load Bible text');
    }
  }
}
