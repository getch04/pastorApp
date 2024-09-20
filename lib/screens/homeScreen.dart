import 'dart:convert';

import 'package:churchapp_flutter/auth/LoginScreen.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/screens/pages/bibleScreenNew.dart';
import 'package:churchapp_flutter/screens/pages/howToScreen.dart';
import 'package:churchapp_flutter/screens/pages/qaListScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonScreen.dart';
import 'package:churchapp_flutter/screens/pages/toolsScreen.dart';
import 'package:churchapp_flutter/socials/UserProfileScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/common_item_card.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/components/swipable_button.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

import '../i18n/strings.g.dart';
import '../providers/AudioPlayerModel.dart';
import '../utils/my_colors.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return const HomeScreenItem();
  }
}

class HomeScreenItem extends StatefulWidget {
  const HomeScreenItem({Key? key}) : super(key: key);

  @override
  _HomeScreenItemState createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late AppStateManager appManager;
  final translator = GoogleTranslator();
  int _currentNavIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  String get getLang {
    //returns like en.hi....
    appManager = Provider.of<AppStateManager>(context, listen: false);

    return appLanguageData[AppLanguage.values[appManager.preferredLanguage]]![
        'value']!;
  }

  Future<Map<String, String>> fetchAndTranslateVerse() async {
    final response = await http.get(Uri.parse(
        "https://beta.ourmanna.com/api/v1/get?format=json&order=daily"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final verseText = data['verse']['details']['text'];
      final verseReference = data['verse']['details']['reference'];

      final translatedVerseText = await translator.translate(verseText,
          to: getLang == "dz" ? 'ne' : getLang);
      final translatedVerseReference = await translator
          .translate(verseReference, to: getLang == "dz" ? 'ne' : getLang);

      return {
        'verseText': translatedVerseText.text,
        'verseReference': translatedVerseReference.text,
      };
    } else {
      throw Exception('Failed to load verse');
    }
  }




  Future<bool> _onWillPop() async {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);
    if (audioPlayerModel.currentMedia != null) {
      return await showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(t.quitapp),
              content: Text(t.quitappaudiowarning),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(t.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    audioPlayerModel.cleanUpResources();
                    Navigator.of(context).pop(true);
                  },
                  child: Text(t.ok),
                ),
              ],
            ),
          ) ??
          false;
    } else {
      return await showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(t.quitapp),
              content: Text(t.quitappwarning),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(t.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text(t.ok),
                ),
              ],
            ),
          ) ??
          false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<AppStateManager>(context).userdata;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.83,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        t.homesentence,
                        textAlign: TextAlign.center,
                        style: TextStyles.subhead(context).copyWith(
                          color: MyColors.nearlyBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      ClipPath(
                        clipper: BannerClipper(),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 255, 170, 0),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: FutureBuilder<Map<String, String>>(
                                future: fetchAndTranslateVerse(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('Language Not Supported');
                                  }
                                  if (snapshot.hasData) {
                                    final verseText =
                                        snapshot.data!['verseText']!;
                                    final verseReference =
                                        snapshot.data!['verseReference']!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          verseText,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          verseReference,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black54,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                })),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 35,
                        ),
                        child: ListView.separated(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final List<Widget> commonItemCards = [
                              CommonItemCard(
                                title: t.sermons,
                                icon: Image.asset(
                                  Img.get('new/sermon.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                onTap: () => Navigator.of(context)
                                    .pushNamed(SermonScreen.routeName),
                              ).animate().fadeIn(duration: 300.ms).slide(
                                    duration: 300.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              CommonItemCard(
                                title: t.biblebooks,
                                icon: Image.asset(
                                  Img.get('new/bible.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                onTap: () => Navigator.of(context).pushNamed(
                                  BibleScreenNew.routeName,
                                ),
                              ).animate().fadeIn(duration: 600.ms).slide(
                                    duration: 600.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              CommonItemCard(
                                title: 'Q & A',
                                icon: Image.asset(
                                  Img.get('new/Q&A.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                onTap: () => Navigator.of(context)
                                    .pushNamed(QAListScreen.routeName),
                              ).animate().fadeIn(duration: 900.ms).slide(
                                    duration: 900.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              CommonItemCard(
                                title: t.tools,
                                icon: Image.asset(
                                  Img.get('new/tools.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  ToolsScreen.routeName,
                                  arguments: ScreenArguements(
                                    position: 0,
                                    items: Categories(
                                      id: 28,
                                      mediaCount: 1,
                                      thumbnailUrl: '',
                                      title: 'Tools',
                                    ),
                                  ),
                                ),
                              ).animate().fadeIn(duration: 1200.ms).slide(
                                    duration: 1200.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              CommonItemCard(
                                title: t.howTo,
                                icon: Image.asset(
                                  Img.get('new/howto.png'),
                                  width: 50,
                                  height: 50,
                                ),
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  HowToScreen.routeName,
                                ),
                              ).animate().fadeIn(duration: 1200.ms).slide(
                                    duration: 1200.ms,
                                    curve: Curves.easeOut,
                                    begin: Offset(0, 0.5),
                                    end: Offset(0, 0),
                                  ),
                              SizedBox(
                                height: 170,
                              ),
                            ];
                            return commonItemCards[index];
                          },
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: const BottomNavigation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height / 2 + 20);
    path.lineTo(20, size.height / 2);
    path.lineTo(0, size.height / 2 - 20);
    path.lineTo(0, 0);
    path.moveTo(size.width, size.height / 2 - 20);
    path.lineTo(size.width - 20, size.height / 2);
    path.lineTo(size.width, size.height / 2 + 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color.fromARGB(255, 3, 92, 164),
            Color(0xff0ebef4),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 164, 164, 164).withOpacity(0.3),
            blurRadius: 1,
            spreadRadius: 5,
            offset: const Offset(0.5, 0.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            context,
            icon: Icons.home_outlined,
            label: t.home,
            routeName: HomeScreen.routeName,
          ),
          _buildNavItem(
            context,
            icon: Icons.category_outlined,
            label: t.sermons,
            routeName: SermonScreen.routeName,
          ),
          _buildNavItem(
            context,
            icon: Icons.menu_book_outlined,
            label: t.biblebooks,
            routeName: BibleScreenNew.routeName,
          ),
          _buildNavItem(
            context,
            icon: Icons.account_circle_outlined,
            label: t.profile,
            routeName: UserProfileScreen.routeName,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon,
      required String label,
      required String routeName}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class RateUsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.share, size: 50, color: Colors.black),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Rate Us',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(Icons.star, color: Colors.amber, size: 20);
                      }),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 140,
              child: SwipeButton.expand(
                elevation: 10,
                thumb: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                ),
                activeThumbColor: Colors.blue,
                activeTrackColor: Colors.blue.withOpacity(0.3),
                onSwipe: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blue,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
