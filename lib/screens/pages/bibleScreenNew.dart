import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/pages/bibleFilterScreen.dart';
import 'package:churchapp_flutter/screens/pages/chapterVerseScreen.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BibleScreenNew extends StatefulWidget {
  BibleScreenNew({Key? key}) : super(key: key);
  static const routeName = "/BibleScreenNew";

  @override
  _BibleScreenNewState createState() => _BibleScreenNewState();
}

class _BibleScreenNewState extends State<BibleScreenNew> {
  @override
  Widget build(BuildContext context) {
    return BibleScreenNewItem();
  }
}

class BibleScreenNewItem extends StatefulWidget {
  BibleScreenNewItem({
    Key? key,
  }) : super(key: key);

  @override
  _BibleScreenNewItemState createState() => _BibleScreenNewItemState();
}

class _BibleScreenNewItemState extends State<BibleScreenNewItem>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<BibleBook> filteredBooks = [];
  List<BibleBook> oldTestamentBooks = [];
  List<BibleBook> newTestamentBooks = [];
  String searchQuery = "";
  bool isLoading = false;
  late BibleFilterProvider filterProvider;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    filterProvider = Provider.of<BibleFilterProvider>(context, listen: false);

    // Listen for changes in the selected Bible
    filterProvider.addListener(() {
      fetchBooks();
    });

    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final selectedBible = filterProvider.selectedBible?.abbr ?? 'ENGESV';

    final url =
        '$BIBLE_BASE_URL/bibles/$selectedBible/book?v=4&key=$BIBLE_API_KEY';

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        final books = data.map((json) => BibleBook.fromJson(json)).toList();

        setState(() {
          oldTestamentBooks
              .addAll(books.where((book) => book.testament == 'OT').toList());
          newTestamentBooks
              .addAll(books.where((book) => book.testament == 'NT').toList());
          filteredBooks = oldTestamentBooks;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      filterBooks();
    });
  }

  void filterBooks() {
    List<BibleBook> books =
        _tabController.index == 0 ? oldTestamentBooks : newTestamentBooks;
    setState(() {
      filteredBooks = books
          .where((book) =>
              book.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Quit App'),
                  content:
                      Text('Do you want to quit the app and stop the audio?'),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<AudioPlayerModel>(context, listen: false)
                            .cleanUpResources();
                        Navigator.of(context).pop(true);
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              )) ??
              false;
        }
        return true;
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.81,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              buildBookDropdown(context,
                  'English Standard Version® - Hear the Word Audio Bible'),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.brown, Colors.brown[300]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: 'Old Testament'),
                          Tab(text: 'New Testament'),
                        ],
                        onTap: (index) {
                          setState(() {
                            filteredBooks = index == 0
                                ? oldTestamentBooks
                                : newTestamentBooks;
                            filterBooks();
                          });
                        },
                        indicatorColor: Colors.white,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white70,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FocusScope(
                          child: Focus(
                            onFocusChange: (hasFocus) {
                              if (!hasFocus) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search books...",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefixIcon: Icon(Icons.search),
                              ),
                              onChanged: updateSearchQuery,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          buildBooksListView(context),
                          buildBooksListView(context),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBooksListView(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: filteredBooks.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final book = filteredBooks[index];
        return ListTile(
          title: Text(book.name, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // if (settings.name == ChapterVerseScreen.routeName) {
            //      final ScreenArguements? args =
            //       settings.arguments as ScreenArguements?;
            //   return MaterialPageRoute(
            //     builder: (context) {
            //       return ChapterVerseScreen(
            //         book: args!.items as BibleBook,
            //         bibleId: args.itemsList as String,
            //       );
            //     },
            //   );
            // }
            Navigator.pushNamed(context, ChapterVerseScreen.routeName,
                arguments: ScreenArguements(
                  items: (book, filterProvider.selectedBible),
                ));
          },
        );
      },
    );
  }

  Widget buildBookDropdown(BuildContext context, String label) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BibleFilterScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.brown,
            width: 2,
          ),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 3, 92, 164).withOpacity(0.3),
              Color(0xff0ebef4).withOpacity(0.3),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.brown[900]),
          ],
        ),
      ),
    );
  }
}
