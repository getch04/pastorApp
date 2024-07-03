import 'package:carousel_slider/carousel_slider.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/img.dart';
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
          title: Text("My Virtual Pastor", style: TextStyles.title(context)),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              padding: EdgeInsets.all(10),
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
                      '\"Your Pastor for 1 year, to help you grow into a person God called you to be.\"',
                      textAlign: TextAlign.center,
                      style: TextStyles.subhead(context).copyWith(
                        color: MyColors.nearlyBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        children: [
                          _buildGridItem('Sermons', Img.get('new/sermon.png')),
                          _buildGridItem('Bible', Img.get('new/bible.png')),
                          _buildGridItem('Q & A\'s', Img.get('new/Q&A.png')),
                          _buildGridItem('Tools', Img.get('new/tools.png')),
                        ],
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
            child: DrawerScreen(),
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
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Img.get('new/home.png'),
                      width: 30,
                      height: 30,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Img.get('new/menu_sermon.png'),
                    width: 30,
                    height: 30,
                  ),
                  label: "Sermon",
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Img.get('new/menu_bible.png'),
                      width: 30,
                      height: 30,
                    ),
                    label: "Bible"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Img.get('new/profile.png'),
                      width: 30,
                      height: 30,
                    ),
                    label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(String title, String iconPath) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(iconPath, height: 100),
            Text(
              title,
              style: TextStyles.title(context)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
