import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/models/bibleApiResponse.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/verse.dart';
import 'package:churchapp_flutter/screens/pages/biblePlayerScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class ChapterVerseScreen extends StatelessWidget {
  static const routeName = '/chapter-verse';
  final (BibleBook, BibleData) book;

  const ChapterVerseScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ChapterVerseScreenContent(book: book);
  }
}

class ChapterVerseScreenContent extends StatefulWidget {
  final (BibleBook, BibleData) book;

  ChapterVerseScreenContent({required this.book});

  @override
  _ChapterVerseScreenContentState createState() =>
      _ChapterVerseScreenContentState();
}

class _ChapterVerseScreenContentState extends State<ChapterVerseScreenContent> {
  List<int> chapters = [];
  List<String> verses = [];
  int selectedChapter = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchChapters();
  }

  void fetchChapters() {
    setState(() {
      chapters = widget.book.$1.chapters;
      fetchVerses(selectedChapter);
    });
  }

  Future<void> fetchVerses(int chapter) async {
    setState(() {
      isLoading = true;
    });

    final url =
        '$BIBLE_BASE_URL/bibles/filesets/${widget.book.$2.abbr}/${widget.book.$1.bookId}/$chapter?v=4&key=$BIBLE_API_KEY';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        final versesList = data.map((json) => Verse.fromJson(json)).toList();

        setState(() {
          verses = versesList
              .where((verse) => verse.chapter == chapter)
              .map((verse) => verse.verseText)
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load verses');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  void onChapterSelected(int chapter) {
    setState(() {
      selectedChapter = chapter;
      fetchVerses(chapter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.82,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${widget.book.$1.name}'.toUpperCase(),
                  style: TextStyles.title(context).copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 10,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Chapters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  itemCount: chapters.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final chapter = chapters[index];
                    return ChoiceChip(
                      label: Text(chapter.toString()),
                      selected: selectedChapter == chapter,
                      onSelected: (selected) => onChapterSelected(chapter),
                      selectedColor: Colors.brown,
                      backgroundColor: Colors.brown[100],
                      labelStyle: TextStyle(
                        color: selectedChapter == chapter
                            ? Colors.white
                            : Colors.brown,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: 5,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade400,
                              highlightColor: Colors.grey[100]!,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 18.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 56.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: verses.length,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            final verse = verses[index];
                            return ListTile(
                              title: Text('Verse ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  BiblePlayerScreen.routeName,
                                  arguments: ScreenArguements(
                                    items: (
                                      chapters.isNotEmpty ? chapters.last : 0,
                                      widget.book.$2,
                                      selectedChapter.toString(),
                                      widget.book.$1,
                                    ),
                                  ),
                                );
                              },
                              subtitle: Text(
                                verse,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
