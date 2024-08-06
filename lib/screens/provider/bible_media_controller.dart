import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/models/models/bibleApiResponse.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/bible_file_response.dart';
import 'package:churchapp_flutter/models/models/bible_text_response.dart';
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
  BibleData? bibleData;
  BibleBook? bibleBook;
  late AudioController audioController;

  //set current chapter
  void initData(int chapter, BibleData data, BibleBook book, int max) {
    currentChapter = chapter;
    bibleData = data;
    bibleBook = book;
    maxChapter = max;
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

      final audioFilesetId = (bibleData?.filesets ?? [])
          .where((fileset) => fileset.type == 'audio')
          .toList();
      final textFilesetId = (bibleData?.filesets ?? [])
          .where((fileset) => fileset.type.startsWith('text_plain'))
          .toList();

      if (audioFilesetId.isNotEmpty && bibleBook?.testament == 'NT') {
        audiofileSetId =
            audioFilesetId.where((element) => element.size == 'NT').last.id;
      } else if (audioFilesetId.isNotEmpty && bibleBook?.testament == 'OT') {
        audiofileSetId =
            audioFilesetId.where((element) => element.size == 'OT').last.id;
      }

      if (textFilesetId.isNotEmpty && bibleBook?.testament == 'NT') {
        textfileSetId = textFilesetId
            .where((element) => element.size == 'C' || element.size == "NT")
            .first
            .id;
      } else if (textFilesetId.isNotEmpty && bibleBook?.testament == 'OT') {
        textfileSetId =
            textFilesetId.where((element) => element.size == 'OT').first.id;
      }
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

  Future<void> fetchBibleAudioByVerse(String textFilesetId, int chapter) async {
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
