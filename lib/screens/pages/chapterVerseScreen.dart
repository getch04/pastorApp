import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/verse.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/screens/pages/biblePlayerScreen.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ChapterVerseScreen extends StatelessWidget {
  static const routeName = '/chapter-verse';
  final BibleBook book;

  const ChapterVerseScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ChapterVerseScreenContent(book: book);
  }
}

class ChapterVerseScreenContent extends StatefulWidget {
  final BibleBook book;

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

  late BibleFilterProvider filterProvider;
  late AppStateManager appManager;

  @override
  void initState() {
    super.initState();
    appManager = Provider.of<AppStateManager>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      filterProvider = Provider.of<BibleFilterProvider>(context, listen: false);
      fetchChapters();
    });
  }

  void fetchChapters() {
    setState(() {
      chapters = widget.book.chapters;
      fetchVerses(selectedChapter);
    });
  }

  Future<void> fetchVerses(int chapter) async {
    setState(() {
      isLoading = true;
    });

    List<String> filesetIds = appManager.selectedBibleVersion!
        .getTextFilesetIds(filterProvider.selectedType);

    for (String filesetId in filesetIds) {
      final url =
          '$BIBLE_BASE_URL/bibles/filesets/$filesetId/${widget.book.bookId}/$chapter?v=4&key=$BIBLE_API_KEY';

      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = json.decode(response.body)['data'] as List;
          final versesList = data.map((json) => Verse.fromJson(json)).toList();

          setState(() {
            verses = versesList
                .where((verse) =>
                    (verse.chapter ?? verse.chapterStart) == chapter &&
                    verse.verseText != null)
                .map((verse) => verse.verseText!)
                .toList();
            isLoading = false;
          });

          return; // Exit the function as the request was successful
        } else {
          print('Failed to load verses with filesetId: $filesetId');
        }
      } catch (e) {
        print('Error fetching verses with filesetId: $filesetId');
        print(e);
      }
    }

    // If all attempts fail
    setState(() {
      verses = [];
      isLoading = false;
    });
    print('Failed to load verses with all fileset IDs');
    throw Exception('Failed to load verses');
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
                  '${widget.book.name}'.toUpperCase(),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.chapter,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton.icon(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            BiblePlayerScreen.routeName,
                            arguments: ScreenArguements(
                              items: (
                                chapters.isNotEmpty ? chapters.last : 0,
                                selectedChapter.toString(),
                                widget.book,
                                verses
                              ),
                            ),
                          );
                        },
                        label: Text(t.play)),
                  ],
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
                    : verses.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  t.noitemstodisplay,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  t.no_verse_content,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
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
                                  title: Text(t.verse + '${index + 1}',
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
                                          chapters.isNotEmpty
                                              ? chapters.last
                                              : 0,
                                          selectedChapter.toString(),
                                          widget.book,
                                          verses,
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
