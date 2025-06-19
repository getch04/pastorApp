import 'dart:convert';

import 'package:churchapp_flutter/core/common.dart';
import 'package:churchapp_flutter/models/models/language_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/SQLiteDbProvider.dart';
import '../i18n/strings.g.dart';
import '../models/UserEvents.dart';
import '../models/Userdata.dart';
import '../utils/ApiUrl.dart';
import '../utils/app_themes.dart';
import '../utils/langs.dart';
import 'events.dart';

class AppStateManager with ChangeNotifier {
  Userdata? userdata;
  bool? isUserSeenOnboardingPage = false;
  ThemeData? _themeData;
  int preferredLanguage = 0;
  bool autoPlayVideos = true;
  final _themePreference = "theme_preference";
  final _langPreference = "language_preference";
  final _playPreference = "video_preference";
  int preferredTheme = 0;
  bool isLoadingTheme = true;

  BibleVersion? _selectedBibleVersion;

  BibleVersion? get selectedBibleVersion => _selectedBibleVersion;

  AppStateManager() {
    _loadAppSettings();
    getUserData();
    loadSelectedBibleVersion();
    _selectedBibleVersion = selectedBibleVersion ?? defaultBibleVersion;
  }
  // Method to load the selected Bible version from SharedPreferences
  Future<void> loadSelectedBibleVersion() async {
    var prefs = await SharedPreferences.getInstance();
    String? versionJson = prefs.getString('selected_bible_version');

    if (versionJson != null) {
      Map<String, dynamic> versionMap = jsonDecode(versionJson);
      _selectedBibleVersion = BibleVersion.fromJson(versionMap);
    } else {
      _selectedBibleVersion = defaultBibleVersion;
    }

    notifyListeners();
  }

  // Setter for selectedBibleVersion
  set selectedBibleVersion(BibleVersion? version) {
    _selectedBibleVersion = version;
    _saveSelectedBibleVersionToPrefs(version);
    notifyListeners();
  }

  // Method to save the selected Bible version to SharedPreferences as JSON
  Future<void> _saveSelectedBibleVersionToPrefs(BibleVersion? version) async {
    var prefs = await SharedPreferences.getInstance();
    if (version != null) {
      String versionJson = jsonEncode(version.toJson());
      prefs.setString('selected_bible_version', versionJson);
    } else {
      // If the version is null, clear the stored value
      prefs.remove('selected_bible_version');
    }
  }

  //app theme manager
  void _loadAppSettings() {
    SharedPreferences.getInstance().then((prefs) {
      //autoplay videos
      //autoPlayVideos = prefs.getBool(_playPreference) ?? true;
      //load theme
      try {
        preferredTheme = prefs.getInt(_themePreference) ?? 0;
      } catch (e) {
        // quietly pass
      }
      _themeData = appThemeData[AppTheme.values[preferredTheme]];
      try {
        //load app language
        preferredLanguage = prefs.getInt(_langPreference) ?? 0;
      } catch (e) {
        // quietly pass
      }
      switch (
          appLanguageData[AppLanguage.values[preferredLanguage]]!['value']) {
        case "en":
          LocaleSettings.setLocale(AppLocale.en);
          break;

        case "es":
          LocaleSettings.setLocale(AppLocale.es);
          break;
        case "pa":
          LocaleSettings.setLocale(AppLocale.pa);
          break;

        case "hi":
          LocaleSettings.setLocale(AppLocale.hi);
          break;
        case "bn":
          LocaleSettings.setLocale(AppLocale.bn);
          break;
        case "dz":
          LocaleSettings.setLocale(AppLocale.dz);
          break;
        case "kn":
          LocaleSettings.setLocale(AppLocale.kn);
          break;
        case "mr":
          LocaleSettings.setLocale(AppLocale.mr);
          break;
        case "ne":
          LocaleSettings.setLocale(AppLocale.ne);
          break;
        case "or":
          LocaleSettings.setLocale(AppLocale.or);
          break;
        case "ta":
          LocaleSettings.setLocale(AppLocale.ta);
          break;
        case "te":
          LocaleSettings.setLocale(AppLocale.te);
          break;
        case "ur":
          LocaleSettings.setLocale(AppLocale.ur);
          break;
        case "id":
          LocaleSettings.setLocale(AppLocale.id);
          break;
        default:
          LocaleSettings.setLocale(AppLocale.en);

        //add the remaing languages here

        /*
        enum AppLanguage {
  Bengali,
  Dzongkha,
  English, // usa
  French,
  Hindi,
  Indonesian,
  Kannada,
  Marathi,
  Nepali,
  Oriya,
  Portuguese,
  Punjabi,
  Spanish, // mexico
  Tamil,
  Telugu,
  Urdu,
}

/// Returns enum value name without enum class name.
String enumName(AppLanguage anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appLanguageData = {
  AppLanguage.Bengali: {"value": "bn", "name": "Bengali"},
  AppLanguage.Dzongkha: {"value": "dz", "name": "Dzongkha"},
  AppLanguage.English: {"value": "en", "name": "English"},
  AppLanguage.French: {"value": "fr", "name": "French"},
  AppLanguage.Hindi: {"value": "hi", "name": "Hindi"},
  AppLanguage.Indonesian: {"value": "id", "name": "Indonesian"},
  AppLanguage.Kannada: {"value": "kn", "name": "Kannada"},
  AppLanguage.Marathi: {"value": "mr", "name": "Marathi"},
  AppLanguage.Nepali: {"value": "ne", "name": "Nepali"},
  AppLanguage.Oriya: {"value": "or", "name": "Oriya"},
  AppLanguage.Portuguese: {"value": "pt", "name": "Portuguese"},
  AppLanguage.Punjabi: {"value": "pa", "name": "Punjabi"},
  AppLanguage.Spanish: {"value": "es", "name": "Spanish"},
  AppLanguage.Tamil: {"value": "ta", "name": "Tamil"},
  AppLanguage.Telugu: {"value": "te", "name": "Telugu"},
  AppLanguage.Urdu: {"value": "ur", "name": "Urdu"},
};
        */
      }
      isLoadingTheme = false;
      notifyListeners();
    });
  }

  /// Use this method on UI to get selected theme.
  ThemeData? get themeData {
    if (_themeData == null) {
      _themeData = appThemeData[AppTheme.White];
    }
    return _themeData;
  }

  /// Sets theme and notifies listeners about change.
  setTheme(AppTheme theme) async {
    _themeData = appThemeData[theme];
    // Here we notify listeners that theme changed
    // so UI have to be rebuild
    notifyListeners();
    // Save selected theme into SharedPreferences
    var prefs = await SharedPreferences.getInstance();
    preferredTheme = AppTheme.values.indexOf(theme);
    prefs.setInt(_themePreference, preferredTheme);
  }

// Modify the setAppLanguage method
  setAppLanguage(int index) async {
    preferredLanguage = index;
    AppLocale selectedLocale;

    // Set the appropriate locale based on the selected language
    switch (appLanguageData[AppLanguage.values[preferredLanguage]]!['value']) {
      case "en":
        selectedLocale = AppLocale.en;
        break;
      // case "fr":
      //   selectedLocale = AppLocale.fr;
      //   break;
      case "es":
        selectedLocale = AppLocale.es;
        break;
      // case "pt":
      //   selectedLocale = AppLocale.pt;
      //   break;
      case "hi":
        selectedLocale = AppLocale.hi;
        break;
      case "id":
        selectedLocale = AppLocale.id;
        break;
      case "bn":
        selectedLocale = AppLocale.bn;
        break;
      case "dz":
        selectedLocale = AppLocale.dz;
        break;
      case "kn":
        selectedLocale = AppLocale.kn;
        break;
      case "mr":
        selectedLocale = AppLocale.mr;
        break;
      case "ne":
        selectedLocale = AppLocale.ne;
        break;
      case "or":
        selectedLocale = AppLocale.or;
        break;
      case "pa":
        selectedLocale = AppLocale.pa;
        break;
      case "ta":
        selectedLocale = AppLocale.ta;
        break;
      case "te":
        selectedLocale = AppLocale.te;
        break;
      case "ur":
        selectedLocale = AppLocale.ur;
        break;
      default:
        selectedLocale = AppLocale.en;
    }

    // Set the locale
    LocaleSettings.setLocale(selectedLocale);

    // Get the corresponding languageId for the selected language
    int? languageId = _getLanguageIdForLocale(selectedLocale);

    if (languageId != null) {
      // Fetch Bible versions for the selected language
      List<BibleVersion> bibleVersions =
          await fetchBibleVersionsForLocale(languageId);

      // Select the first Bible version, if available
      if (bibleVersions.isNotEmpty) {
        selectedBibleVersion = bibleVersions.first; // Using the setter
      } else {
        selectedBibleVersion = defaultBibleVersion; // Using the setter
      }
    } else {
      // If no languageId found, use the default Bible version
      selectedBibleVersion = defaultBibleVersion;
    }

    // Notify listeners to update the UI
    notifyListeners();

    // Save selected language into SharedPreferences
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(_langPreference, preferredLanguage);
  }

  // Method to get the languageId based on the selected locale
  int? _getLanguageIdForLocale(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 6414;
      case AppLocale.pa:
        return 8247;
      case AppLocale.es:
        return 6411;
      case AppLocale.pt:
        return 5598;
      case AppLocale.hi:
        return 2355;
      case AppLocale.bn:
        return 748;
      case AppLocale.dz:
        return 33689;
      case AppLocale.kn:
        return 5049;
      case AppLocale.mr:
        return 4100;
      case AppLocale.ne:
        return 4756;
      case AppLocale.or:
        return 8567;
      case AppLocale.ta:
        return 6589;
      case AppLocale.te:
        return 6696;
      case AppLocale.ur:
        return 7147;
      case AppLocale.id:
        return 1234;
      default:
        return null;
    }
  }

  Future<List<BibleVersion>> fetchBibleVersionsForLocale(
      int languageTag) async {
    try {
      var response = await Dio().get(
          '$BIBLE_BASE_URL/bibles?language_code=$languageTag&v=4&key=$BIBLE_API_KEY');
      final res = response.data['data'] as List;

      // Convert the response into a list of BibleVersion objects
      final List<BibleVersion> bibleVersions =
          res.map((e) => BibleVersion.fromJson(e)).toList();

      // Filter the list to remove BibleVersions without "dbp-prod" or without any "text" filesets
      final List<BibleVersion> filteredVersions =
          bibleVersions.where((bibleVersion) {
        // Check if "dbp-prod" exists in the filesets map
        if (!bibleVersion.filesets.containsKey('dbp-prod')) {
          return false;
        }

        // Check if there are any filesets in "dbp-prod" with a type that starts with "text"
        bool hasTextFileset = bibleVersion.filesets['dbp-prod']!.any((fileset) {
          return fileset.type.startsWith('text');
        });

        return hasTextFileset;
      }).toList();

      return filteredVersions;
    } catch (e) {
      print('Error fetching Bible versions: $e');
      return [];
    }
  }

  //app language setting
  setAutoPlayVideos(bool checked) async {
    //AppLanguage _preferredLanguage = AppLanguage.values[index];
    autoPlayVideos = checked;

    notifyListeners();
    // Save selected theme into SharedPreferences
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(_playPreference, checked);
  }

  getUserSeenOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("user_seen_onboarding_page") != null) {
      isUserSeenOnboardingPage = prefs.getBool("user_seen_onboarding_page");
    }
  }

  setUserSeenOnboardingPage(bool seen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("user_seen_onboarding_page", seen);
  }

  getUserData() async {
    userdata = await SQLiteDbProvider.db.getUserData();
    print("userdata " + userdata.toString());
    notifyListeners();
    if (userdata != null && userdata!.activated == 0) {
      // eventBus.fire(UserLoggedInEvent(userdata));
      updateUserToken();
    }
  }

  setUserData(Userdata _userdata) async {
    await SQLiteDbProvider.db.deleteUserData();
    await SQLiteDbProvider.db.insertUser(_userdata);
    this.userdata = _userdata;
    if (userdata != null && userdata!.activated == 0) {
      // eventBus.fire(UserLoggedInEvent(userdata));
      updateUserToken();
    }
    notifyListeners();
  }

  unsetUserData() async {
    await SQLiteDbProvider.db.deleteUserData();
    this.userdata = null;
    // eventBus.fire(AppEvents.LOGOUT);
    notifyListeners();
  }

  Future<void> updateUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("firebase_token");
    try {
      final dio = Dio();
      // Adding an interceptor to enable caching.

      final response = await dio.post(
        ApiUrl.updateUserSocialFcmToken,
        data: jsonEncode({
          "data": {"email": userdata!.email, "token": token}
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        print(response.data);
      }
    } catch (exception) {
      // I get no exception here
      print(exception);
    }
  }
}
