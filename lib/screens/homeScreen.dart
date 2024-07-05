import 'package:carousel_slider/carousel_slider.dart';
import 'package:churchapp_flutter/auth/LoginScreen.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/models/Userdata.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/BibleScreen.dart';
import 'package:churchapp_flutter/screens/CategoriesScreen.dart';
import 'package:churchapp_flutter/screens/Downloader.dart';
import 'package:churchapp_flutter/socials/UserProfileScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:churchapp_flutter/utils/title_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../i18n/strings.g.dart';
import '../providers/AudioPlayerModel.dart';
import '../screens/DrawerScreen.dart';
import '../utils/my_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScreenItem();
  }
}

class HomeScreenItem extends StatefulWidget {
  HomeScreenItem({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenItemState createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  int _currentNavIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Userdata? userdata = Provider.of<AppStateManager>(context).userdata;

    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await (showDialog(
                context: context,
                builder: (context) => new CupertinoAlertDialog(
                  title: new Text(t.quitapp),
                  content: new Text(t.quitappaudiowarning),
                  actions: <Widget>[
                    new ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(t.cancel),
                    ),
                    new ElevatedButton(
                      onPressed: () {
                        Provider.of<AudioPlayerModel>(context, listen: false)
                            .cleanUpResources();
                        Navigator.of(context).pop(true);
                      },
                      child: new Text(t.ok),
                    ),
                  ],
                ),
              ))) ??
              false;
        } else {
          return (await (showDialog(
                context: context,
                builder: (context) => new CupertinoAlertDialog(
                  title: new Text(t.quitapp),
                  content: new Text(t.quitappwarning),
                  actions: <Widget>[
                    new ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text(t.cancel),
                    ),
                    new ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: new Text(t.ok),
                    ),
                  ],
                ),
              ))) ??
              false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.appname.toTitleCase(),
              style: TextStyles.title(context)
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 20,
              width: 20,
              child: Image.asset(
                Img.get('new/menu.png'),
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[300]!,
                  Colors.purple[100]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(left: 0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.cloud_download,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Downloader.routeName,
                          arguments: ScreenArguements(
                            position: 0,
                            items: null,
                          ));
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.5,
                0.9,
              ],
              colors: [
                Color.fromARGB(255, 255, 244, 148),
                Color.fromARGB(255, 181, 255, 185)
              ],
            ),
          ),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: [
                  Img.get('new/1.jpg'),
                  Img.get('new/2.jpg'),
                  Img.get('new/3.jpg'),
                  Img.get('new/4.jpg'),
                  Img.get('new/5.jpg'),
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: 5,
                effect: WormEffect(
                  dotHeight: 12.0,
                  dotWidth: 12.0,
                  activeDotColor: Colors.blue[300]!,
                  dotColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '\"${t.homesentence}\"',
                      textAlign: TextAlign.center,
                      style: TextStyles.subhead(context).copyWith(
                        color: MyColors.nearlyBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 35),
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 1.175,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          children: [
                            _buildGridItem(
                              title: t.sermons,
                              iconPath: Img.get('new/sermon.png'),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(CategoriesScreen.routeName);
                              },
                            ),
                            //bible
                            _buildGridItem(
                              title: t.biblebooks,
                              iconPath: Img.get('new/bible.png'),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(BibleScreen.routeName);
                              },
                            ),
                            //Q&A
                            _buildGridItem(
                              title: 'Q & A\'s',
                              iconPath: Img.get('new/Q&A.png'),
                              onTap: () {
                                // Navigator.of(context).pushNamed(QnAScreen.routeName);
                              },
                            ),
                            //tools
                            _buildGridItem(
                              title: t.tools,
                              iconPath: Img.get('new/tools.png'),
                              onTap: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Container(
          color: MyColors.grey_95,
          width: 300,
          child: Drawer(
            child: ChangeNotifierProvider(
                create: (context) => HomeProvider(), child: DrawerScreen()),
          ),
        ),
        key: scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[300]!,
                Colors.purple[100]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              currentIndex: _currentNavIndex,
              selectedIconTheme: IconThemeData(size: 30),
              selectedLabelStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              onTap: (index) {
                setState(() {
                  _currentNavIndex = index;
                });
                if (index == 1) {
                  // route to hymns
                  Navigator.of(context).pushNamed(CategoriesScreen.routeName);
                } else if (index == 2) {
                  Navigator.of(context).pushNamed(BibleScreen.routeName);
                } else if (index == 3) {
                  if (userdata == null) {
                    //route to login
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                    return;
                  } else {
                    //profile
                    Navigator.of(context).pushNamed(UserProfileScreen.routeName,
                        arguments: ScreenArguements(items: userdata));
                  }
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Img.get('new/home.png'),
                      width: 25,
                      height: 25,
                    ),
                    label: t.home),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Img.get('new/menu_sermon.png'),
                    width: 25,
                    height: 25,
                  ),
                  label: t.sermons,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Img.get('new/menu_bible.png'),
                    width: 25,
                    height: 25,
                  ),
                  label: t.biblebooks,
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Img.get('new/profile.png'),
                      width: 25,
                      height: 25,
                    ),
                    label: t.profile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required String title,
    required String iconPath,
    required Function() onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 1.23),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(iconPath, height: 70),
              Text(
                title,
                style: TextStyles.title(context)
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
