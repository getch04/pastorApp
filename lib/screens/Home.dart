import 'package:churchapp_flutter/audio_player/player_page.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/utils/Utility.dart';
import 'package:churchapp_flutter/video_player/VideoPlayer.dart';
import '../screens/BibleScreen.dart';
import '../providers/AudioPlayerModel.dart';
import '../audio_player/miniPlayer.dart';
import '../models/ScreenArguements.dart';
import '../models/Userdata.dart';
import '../screens/BranchesScreen.dart';
import '../livetvplayer/LivestreamsPlayer.dart';
import '../screens/EventsListScreen.dart';
import '../screens/InboxListScreen.dart';
import '../screens/HymnsListScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/CategoriesScreen.dart';
import '../screens/DevotionalScreen.dart';
import '../screens/VideoScreen.dart';
import '../screens/AudioScreen.dart';
import '../notes/NotesListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/HomeProvider.dart';
import '../utils/img.dart';
import '../models/Media.dart';
import '../models/Radios.dart';
import '../i18n/strings.g.dart';
import '../utils/TextStyles.dart';
import '../screens/HomeSlider.dart';
import '../screens/NoitemScreen.dart';
import '../utils/ApiUrl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

enum HomeIndex { CATEGORIES, VIDEOS, AUDIOS, BIBLEBOOKS,  RADIO }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.userdata}) : super(key: key);
  final Userdata? userdata;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeProvider? homeProvider;

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).loadItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Appbar(),
            Expanded(
              child: HomePageBody(
                homeProvider: homeProvider,
                key: UniqueKey(),
              ),
            ),
            MiniPlayer(),
          ],
        ),
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key? key,
    required this.homeProvider,
  }) : super(key: key);

  final HomeProvider? homeProvider;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int _selectedIndex = 0;

  onRetryClick() {
    widget.homeProvider!.loadItems();
  }

  openBrowserTab(String url) async {
    await FlutterWebBrowser.openWebPage(
      url: url,
      customTabsOptions: CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: MyColors.primary,
        preferredControlTintColor: MyColors.primary,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppStateManager>(context);
    if (widget.homeProvider!.isLoading) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                enabled: true,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 12,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (widget.homeProvider!.isError) {
      return NoitemScreen(
          title: t.oops, message: t.dataloaderror, onClick: onRetryClick);
    } else
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 0),

            //HomeSlider(homeProvider!.data['sliders'] as List<Media>?),
            // _buildBestSellersItemsUsingCarousel(
            //    widget.homeProvider!.data['sliders'] as List<Media>),
            Container(height: 0),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      iconCircle(
                          Colors.lightGreen[500]!, t.website, Icons.camera, () {
                        openBrowserTab(
                            widget.homeProvider!.data['website'] as String);
                      }),
                      iconCircle(
                          Colors.orange[300]!, t.branches, Icons.location_city,
                          () {
                        Navigator.of(context)
                            .pushNamed(BranchesScreen.routeName);
                      }),
                      iconCircle(
                          Colors.purple[400]!, t.hymns, Icons.library_books,
                          () {
                        Navigator.of(context)
                            .pushNamed(HymnsListScreen.routeName);
                      }),
                      iconCircle(Colors.blue[500]!, t.events, Icons.event, () {
                        Navigator.of(context)
                            .pushNamed(EventsListScreen.routeName);
                      }),
                    ],
                  ),
                  Container(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      iconCircle(Colors.pink, t.inbox, Icons.email, () {
                        Navigator.of(context)
                            .pushNamed(InboxListScreenState.routeName);
                      }),
                      iconCircle(Colors.green[500]!, t.devotionals,
                          Icons.library_books, () {
                        Navigator.of(context)
                            .pushNamed(DevotionalScreen.routeName);
                      }),
                      iconCircle(Colors.lightGreen[400]!, t.notes, Icons.book,
                          () {
                        Navigator.of(context)
                            .pushNamed(NotesListScreen.routeName);
                      }),
                      iconCircle(Colors.indigo, t.donate, Icons.attach_money,
                          () {
                        openBrowserTab(ApiUrl.DONATE);
                      }),
                    ],
                  ),
                  Container(height: 15),
                ],
              ),
            ),

            Container(height: 15),
            Container(
              margin: EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ItemTile(
                      index: HomeIndex.CATEGORIES,
                      homeProvider: widget.homeProvider,
                      title: t.categories,
                      thumbnail: "assets/images/category.png",
                      color: Colors.amber[100]!,
                    ),
                  ),
                  Expanded(
                    child: ItemTile(
                      index: HomeIndex.VIDEOS,
                      homeProvider: widget.homeProvider,
                      title: t.videos,
                      thumbnail: "assets/images/videos.jpg",
                      color: Colors.lightBlue[100]!,
                    ),
                  ),
                  Expanded(
                    child: ItemTile(
                      index: HomeIndex.AUDIOS,
                      homeProvider: widget.homeProvider,
                      title: t.audios,
                      thumbnail: "assets/images/audios.jpg",
                      color: Colors.lime[100]!,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ItemTile(
                      index: HomeIndex.BIBLEBOOKS,
                      homeProvider: widget.homeProvider,
                      title: t.biblebooks,
                      thumbnail: "assets/images/bible.jpg",
                      color: Colors.green[100]!,
                    ),
                  ),
                  // Expanded(
                  //   child: ItemTile(
                  //     index: HomeIndex.LIVESTREAMS,
                  //     homeProvider: widget.homeProvider,
                  //     title: t.livestreams,
                  //     thumbnail: "assets/images/livestream.jpg",
                  //     color: Colors.orange[100]!,
                  //   ),
                  // ),
                  Expanded(
                    child: ItemTile(
                      index: HomeIndex.RADIO,
                      homeProvider: widget.homeProvider,
                      title: t.radio,
                      thumbnail: "assets/images/radio.jpg",
                      color: Colors.pink[100]!,
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 20),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: Text(
                  "Follow us on",
                  style: TextStyles.headline(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: "serif",
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      openBrowserTab(
                          widget.homeProvider!.data['facebook_page'] as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_facebook.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(width: 10),
                  InkWell(
                    onTap: () {
                      openBrowserTab(
                          widget.homeProvider!.data['youtube_page'] as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_youtube.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(width: 10),
                  InkWell(
                    onTap: () {
                      openBrowserTab(
                          widget.homeProvider!.data['twitter_page'] as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_twitter.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(width: 10),
                  InkWell(
                    onTap: () {
                      openBrowserTab(widget.homeProvider!.data['instagram_page']
                          as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_instagram.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),

            Container(height: 15),
          ],
        ),
      );
  }

  Widget iconCircle(
      Color color, String text, IconData icon, Function callback) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              gradient: LinearGradient(
                colors: [Colors.white, color],
                stops: [0, 0.5],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _buildBestSellersItemsUsingCarousel(List<Media> sliders) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0),
      height: 180,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Stack(
          children: <Widget>[
            CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  Media curObj = sliders[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      child: Container(
                        height: 180.0,
                        width: double.infinity,
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 180.0,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: curObj.coverPhoto!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                      child: CupertinoActivityIndicator()),
                                  errorWidget: (context, url, error) => Center(
                                      child: Icon(
                                    Icons.error,
                                    color: Colors.grey,
                                  )),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.all(12),
                                alignment: Alignment.center,
                                color: Colors.black45,
                                child: Text(
                                  curObj.title!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (curObj.mediaType!.toLowerCase() == "audio") {
                          Provider.of<AudioPlayerModel>(context, listen: false)
                              .preparePlaylist(
                                  Utility.extractMediaByType(
                                      Utility.extractMediaByType(
                                          sliders, curObj.mediaType),
                                      curObj.mediaType),
                                  curObj);
                          Navigator.of(context).pushNamed(PlayPage.routeName);
                        } else {
                          Navigator.pushNamed(context, VideoPlayer.routeName,
                              arguments: ScreenArguements(
                                position: 0,
                                items: curObj,
                                itemsList: Utility.extractMediaByType(
                                    sliders, curObj.mediaType),
                              ));
                        }
                      },
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 220,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.7,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                )),
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String title;
  final String thumbnail;
  final Color color;
  final HomeIndex index;
  final HomeProvider? homeProvider;

  const ItemTile({
    Key? key,
    required this.index,
    required this.title,
    required this.thumbnail,
    required this.homeProvider,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (index) {
          case HomeIndex.CATEGORIES:
            Navigator.of(context).pushNamed(CategoriesScreen.routeName);
            break;
          case HomeIndex.VIDEOS:
            Navigator.of(context).pushNamed(VideoScreen.routeName);
            break;
          case HomeIndex.AUDIOS:
            Navigator.of(context).pushNamed(AudioScreen.routeName);
            break;
          case HomeIndex.BIBLEBOOKS:
            Navigator.of(context).pushNamed(BibleScreen.routeName);
            break;
          // case HomeIndex.LIVESTREAMS:
          //   Navigator.of(context).pushNamed(LivestreamsPlayer.routeName,
          //       arguments: ScreenArguements(
          //         position: 0,
          //         items: homeProvider!.data['livestream'],
          //         itemsList: [],
          //       ));
          //   break;
          case HomeIndex.RADIO:
            Radios radios = homeProvider!.data['radios'] as Radios;
            Media media = new Media(
                id: radios.id,
                title: radios.title,
                coverPhoto: radios.coverPhoto,
                streamUrl: radios.streamUrl);
            Provider.of<AudioPlayerModel>(context, listen: false)
                .prepareradioplayer([media], media);
            //Navigator.of(context).pushNamed(RadioPlayer.routeName);
            break;
        }
      },
      child: Column(
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey[300]!, width: 0.5)),
            color: color,
            child: Container(
              height: 120,
              width: 120,
              padding: EdgeInsets.all(8),
              child: Image.asset(
                thumbnail,
                height: 75,
                width: 75,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    /*Padding(
      padding: const EdgeInsets.only(right: 3.0, left: 3.00),
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: CachedNetworkImage(
                    imageUrl: thumbnail,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black12, BlendMode.darken)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: Image.asset(
                      assetsImage,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      //color: Colors.black26,
                    )),
                  ),
                ),
              ),
              SizedBox(height: 0.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  //color: Colors.black54,
                  height: 35,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyles.caption(context).copyWith(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      //color: Colors.white,
                      fontFamily: "serif",
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          switch (index) {
            case HomeIndex.CATEGORIES:
              Navigator.of(context).pushNamed(CategoriesScreen.routeName);
              break;
            case HomeIndex.VIDEOS:
              Navigator.of(context).pushNamed(VideoScreen.routeName);
              break;
            case HomeIndex.AUDIOS:
              Navigator.of(context).pushNamed(AudioScreen.routeName);
              break;
            case HomeIndex.BIBLEBOOKS:
              Navigator.of(context).pushNamed(BibleScreen.routeName);
              break;
            case HomeIndex.LIVESTREAMS:
              Navigator.of(context).pushNamed(LivestreamsPlayer.routeName,
                  arguments: ScreenArguements(
                    position: 0,
                    items: homeProvider!.data['livestream'],
                    itemsList: [],
                  ));
              break;
            case HomeIndex.RADIO:
              Radios radios = homeProvider!.data['radios'] as Radios;
              Media media = new Media(
                  id: radios.id,
                  title: radios.title,
                  coverPhoto: radios.coverPhoto,
                  streamUrl: radios.streamUrl);
              Provider.of<AudioPlayerModel>(context, listen: false)
                  .prepareradioplayer(media);
              //Navigator.of(context).pushNamed(RadioPlayer.routeName);
              break;
          }
        },
      ),
    );*/
  }
}
