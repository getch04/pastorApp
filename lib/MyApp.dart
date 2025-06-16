import 'package:churchapp_flutter/auth/SplashScreen.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/models/faqResult.dart';
import 'package:churchapp_flutter/models/models/bible_book.dart';
import 'package:churchapp_flutter/models/models/howto_model.dart';
import 'package:churchapp_flutter/models/models/splash.dart';
import 'package:churchapp_flutter/screens/OnboardingPage.dart';
import 'package:churchapp_flutter/screens/appTermsScreen.dart';
import 'package:churchapp_flutter/screens/homeScreen.dart';
import 'package:churchapp_flutter/screens/pages/aboutUsScreen.dart';
import 'package:churchapp_flutter/screens/pages/bibleFilterScreen.dart';
import 'package:churchapp_flutter/screens/pages/biblePlayerScreen.dart';
import 'package:churchapp_flutter/screens/pages/bibleScreenNew.dart';
import 'package:churchapp_flutter/screens/pages/chapterVerseScreen.dart';
import 'package:churchapp_flutter/screens/pages/howToScreen.dart';
import 'package:churchapp_flutter/screens/pages/languageDetailScreen.dart';
import 'package:churchapp_flutter/screens/pages/offeringScreen.dart';
import 'package:churchapp_flutter/screens/pages/qaAnswerScreen.dart';
import 'package:churchapp_flutter/screens/pages/qaListScreen.dart';
// import 'package:churchapp_flutter/screens/pages/sermonListScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonPlayerScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonScreen.dart';
import 'package:churchapp_flutter/screens/pages/toolsDetailScreen.dart';
import 'package:churchapp_flutter/screens/pages/toolsScreen.dart';
import 'package:churchapp_flutter/screens/privacyScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import './auth/ForgotPasswordScreen.dart';
import './auth/LoginScreen.dart';
import './auth/RegisterScreen.dart';
import './models/Media.dart';
import './models/ScreenArguements.dart';
import './models/UserEvents.dart';
import './models/Userdata.dart';
import './providers/AppStateManager.dart';
import './providers/AudioPlayerModel.dart';
import './providers/events.dart';
import './service/Firebase.dart';
import './socials/UserProfileScreen.dart';
import 'screens/pages/howToScreenDetail.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    // required Widget? defaultHome,
  }) : super(key: key);
  // final Widget? _defaultHome;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late AppStateManager appStateManager;
  AppLifecycleState? state;
  // bool isChatOpen = false;
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  navigateMedia(Media media) {
    print("push notification media = " + media.title!);
    List<Media?> mediaList = [];
    mediaList.add(media);
    if (media.mediaType!.toLowerCase() == "audio") {
      print("audio media = " + media.title!);
      Provider.of<AudioPlayerModel>(context, listen: false)
          .preparePlaylist(mediaList, media);
      // navigatorKey.currentState!.pushNamed(PlayPage.routeName);
    } else {
      print("video media = " + media.title!);

      // navigatorKey.currentState!.pushNamed(VideoPlayer.routeName,
      //     arguments: ScreenArguements(
      //       position: 0,
      //       items: media,
      //       itemsList: mediaList,
      //     ));
    }
  }

  // navigateLivestreams(LiveStreams liveStreams) {
  //   navigatorKey.currentState!.pushNamed(LivestreamsPlayer.routeName,
  //       arguments: ScreenArguements(
  //         items: liveStreams,
  //       ));
  // }

  // navigateInbox(Inbox inbox) {
  //   //navigatorKey.currentState.pushNamed(InboxListScreenState.routeName);
  //   navigatorKey.currentState!.pushNamed(InboxViewerScreen.routeName,
  //       arguments: ScreenArguements(
  //         position: 0,
  //         items: inbox,
  //         itemsList: [],
  //       ));
  // }

  // navigateEvents(Events events) {
  //   //navigatorKey.currentState.pushNamed(InboxListScreenState.routeName);
  //   navigatorKey.currentState!.pushNamed(EventsViewerScreen.routeName,
  //       arguments: ScreenArguements(
  //         position: 0,
  //         items: events,
  //         itemsList: [],
  //       ));
  // }

  // navigateChat(Userdata partner) async {
  //   Userdata? userdata = await SQLiteDbProvider.db.getUserData();
  //   if (userdata == null) {
  //     navigatorKey.currentState!.pushNamed(LoginScreen.routeName);
  //     //eventBus.fire(AppEvents.ONCHATCONVERSATIONCLOSED);
  //   } else {
  //     if (isChatOpen) {
  //       navigatorKey.currentState!.pop();
  //     }
  //     eventBus.fire(StartPartnerChatEvent(partner));
  //     // navigatorKey.currentState!.pushNamed(ChatConversations.routeName);
  //     //navigatorKey.currentState
  //     //  .popUntil(ModalRoute.withName(Home.routeName));
  //     //navigatorKey.currentState.pushNamed(ChatConversations.routeName);
  //     /*if (isChatOpen) {
  //       navigatorKey.currentState.popAndPushNamed(ChatConversations.routeName);
  //     } else {
  //       navigatorKey.currentState.pushNamed(ChatConversations.routeName);
  //     }*/
  //   }
  // }

  @override
  void initState() {
    Firebase(
      navigateMedia,
      // navigateSocials,
      // navigateInbox,
      // navigateLivestreams,
      // navigateChat,
      // navigateEvents,
    ).init();
    // Provider.of<ChatManager>(context, listen: false).init();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    eventBus.fire(OnAppStateChanged("active"));
    // eventBus.on<OnChatOpen>().listen((event) {
    //   isChatOpen = event.isOpen;
    // });
    eventBus.on<OnAppOffline>().listen((event) {
      print("App offline event called");
      print("please store = " + event.items.toString());
    });
  }

  @override
  void dispose() {
    print("widget is disposed");
    WidgetsBinding.instance.removeObserver(this);
    //Provider.of<AudioPlayerModel>(context, listen: false).cleanUpResources();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) async {
    state = appLifecycleState;
    print("Current app state = " + appLifecycleState.toString());
    print(":::::::");
    switch (state) {
      case AppLifecycleState.hidden:
      case null:
        break;
      case AppLifecycleState.paused:
        eventBus.fire(OnAppStateChanged("idle"));
        break;
      case AppLifecycleState.resumed:
        eventBus.fire(OnAppStateChanged("active"));
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    appStateManager = Provider.of<AppStateManager>(context);
    final platform = Theme.of(context).platform;
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => MaterialClassicHeader(),
      footerBuilder: () => ClassicFooter(),
      enableLoadingWhenNoData: false,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      //autoLoad: true,
      child: MaterialApp(
        theme: appStateManager.themeData,
        navigatorKey: navigatorKey,
        title: 'App',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == UserProfileScreen.routeName) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return UserProfileScreen(
                  user: args?.items as Userdata?,
                );
              },
            );
          }
          // if (settings.name == UpdateUserProfile.routeName) {
          //   final ScreenArguements? args =
          //       settings.arguments as ScreenArguements?;
          //   return MaterialPageRoute(
          //     builder: (context) {
          //       return UpdateUserProfile(
          //         check: args == null ? true : false,
          //       );
          //     },
          //   );
          // }

          if (settings.name == LoginScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            );
          }

          if (settings.name == RegisterScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return RegisterScreen();
              },
            );
          }
          if (settings.name == SplashScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return SplashScreen();
              },
            );
          }

          if (settings.name == ForgotPasswordScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return ForgotPasswordScreen();
              },
            );
          }

          if (settings.name == AppTermsAndConditionsScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return AppTermsAndConditionsScreen();
              },
            );
          }

          if (settings.name == PrivacyPolicyScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return PrivacyPolicyScreen();
              },
            );
          }
          if (settings.name == HomeScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            );
          }
          if (settings.name == SermonScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return SermonScreen();
              },
            );
          }
          if (settings.name == SermonPlayerScreen.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return SermonPlayerScreen(
                  data: args!.items as (Categories, List<Categories>),
                );
              },
            );
          }
          if (settings.name == BibleScreenNew.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BibleScreenNew();
              },
            );
          }
          if (settings.name == BibleFilterScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return BibleFilterScreen();
              },
            );
          }
          if (settings.name == BiblePlayerScreen.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements;
            return MaterialPageRoute(
              builder: (context) {
                return BiblePlayerScreen(
                  data: args!.items as (int, String, BibleBook, List<String>),
                );
              },
            );
          }
          if (settings.name == QAListScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return QAListScreen();
              },
            );
          }
          if (settings.name == OnboardingPage.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return OnboardingPage(
                  splashes: settings.arguments as List<Splash>,
                );
              },
            );
          }
          if (settings.name == ChapterVerseScreen.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return ChapterVerseScreen(
                  book: args!.items as BibleBook,
                );
              },
            );
          }
          if (settings.name == QAAnswerScreen.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return QAAnswerScreen(
                  faq: args!.items as FAQ,
                );
              },
            );
          }
          if (settings.name == AboutUsNewScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return AboutUsNewScreen();
              },
            );
          }
          if (settings.name == OfferingScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return OfferingScreen();
              },
            );
          }
          if (settings.name == HowToScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return HowToScreen();
              },
            );
          }
          if (settings.name == HowToDetailScreen.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return HowToDetailScreen(
                  howToModel: args!.items as HowToModel,
                );
              },
            );
          }
          if (settings.name == LanguageDetailScreen.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return LanguageDetailScreen(
                  languageId: args!.items as dynamic,
                );
              },
            );
          }
          if (settings.name == ToolsScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return ToolsScreen();
              },
            );
          }
          if (settings.name == ToolsDetailScreen.routeName) {
            final ScreenArguements? args =
                settings.arguments as ScreenArguements?;
            return MaterialPageRoute(
              builder: (context) {
                return ToolsDetailScreen(
                  media: args!.items as Media?,
                );
              },
            );
          }

          return MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          );
        },
      ),
    );
  }
}
