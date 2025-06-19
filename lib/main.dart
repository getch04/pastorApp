import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller2.dart';
import 'package:churchapp_flutter/screens/provider/bilbe_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

import './providers/AudioPlayerModel.dart';
import './providers/SubscriptionModel.dart';
import './providers/translate_provider.dart';
import './utils/my_colors.dart';
import 'MyApp.dart';
import 'providers/AppStateManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  // await Firebase.initializeApp();
  // await DownloadManager.instance.init(
  //   isolates: 5,
  // );
  await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
      notificationColor: MyColors.primary);
  //InAppPurchaseConnection.enablePendingPurchases();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Color(0xff3d93be),
        statusBarBrightness: Brightness.light),
  );

  await dotenv.load(fileName: ".env");

  runApp(
    TranslationProvider(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppStateManager()),
          // ChangeNotifierProvider(create: (_) => BookmarksModel()),
          // ChangeNotifierProvider(create: (_) => PlaylistsModel()),
          ChangeNotifierProvider(create: (_) => AudioPlayerModel()),
          // ChangeNotifierProvider(create: (_) => DownloadsModel()),
          ChangeNotifierProvider(create: (_) => SubscriptionModel()),
          // ChangeNotifierProvider(create: (_) => HymnsBookmarksModel()),
          // ChangeNotifierProvider(create: (_) => NotesProvider()),
          // ChangeNotifierProvider(create: (_) => BibleModel()),
          ChangeNotifierProvider(create: (_) => TranslateProvider()),
          // ChangeNotifierProvider(create: (_) => ChatManager()),
          ChangeNotifierProvider(create: (_) => BibleFilterProvider()),
          ChangeNotifierProvider(create: (_) => AudioController()),
          ChangeNotifierProvider(create: (_) => AudioController2()),
        ],
        child: MyApp(),
      ),
    ),
  );
}
