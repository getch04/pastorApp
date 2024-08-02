import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/pages/bibleFilterScreen.dart';
import 'package:churchapp_flutter/screens/pages/chapterVerseScreen.dart';
import 'package:churchapp_flutter/screens/provider/bible_book_provider.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:churchapp_flutter/screens/provider/search_provider.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BibleScreenNew extends StatelessWidget {
  BibleScreenNew({Key? key}) : super(key: key);
  static const routeName = "/BibleScreenNew";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => BibleFilterProvider()),
        ChangeNotifierProvider(create: (context) => BibleBooksProvider()),
      ],
      child: BibleScreenNewItem(),
    );
  }
}

class BibleScreenNewItem extends StatefulWidget {
  @override
  _BibleScreenNewItemState createState() => _BibleScreenNewItemState();
}

class _BibleScreenNewItemState extends State<BibleScreenNewItem>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BibleFilterProvider filterProvider;
  late BibleBooksProvider bibleBooksProvider;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      filterProvider = Provider.of<BibleFilterProvider>(context, listen: false);
      bibleBooksProvider =
          Provider.of<BibleBooksProvider>(context, listen: false);

      filterProvider.addListener(() {
        bibleBooksProvider
            .fetchBooks(filterProvider.selectedBible?.abbr ?? 'ENGESV');
      });

      bibleBooksProvider
          .fetchBooks(filterProvider.selectedBible?.abbr ?? 'ENGESV');
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
                      Consumer<BibleBooksProvider>(
                        builder: (context, provider, child) => TabBar(
                          controller: _tabController,
                          tabs: [
                            Tab(text: 'Old Testament'),
                            Tab(text: 'New Testament'),
                          ],
                          indicatorColor: Colors.white,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchBox(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Consumer<BibleBooksProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        BooksListView(isOldTestament: true),
                        BooksListView(isOldTestament: false),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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

class BooksListView extends StatefulWidget {
  final bool isOldTestament;

  BooksListView({Key? key, required this.isOldTestament}) : super(key: key);

  @override
  _BooksListViewState createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer2<BibleBooksProvider, SearchProvider>(
      builder: (context, booksProvider, searchProvider, child) {
        final books = widget.isOldTestament
            ? booksProvider.oldTestamentBooks
            : booksProvider.newTestamentBooks;
        final filteredBooks = books
            .where((book) => book.name
                .toLowerCase()
                .contains(searchProvider.searchQuery.toLowerCase()))
            .toList();

        return ListView.separated(
          padding: EdgeInsets.all(8.0),
          itemCount: filteredBooks.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final book = filteredBooks[index];
            return ListTile(
              title: Text(book.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ChapterVerseScreen.routeName,
                  arguments: ScreenArguements(
                    items: (
                      book,
                      Provider.of<BibleFilterProvider>(context, listen: false)
                          .selectedBible
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
