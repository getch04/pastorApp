import 'package:churchapp_flutter/models/models/bibleApiResponse.dart';
import 'package:churchapp_flutter/models/models/language.dart';
import 'package:churchapp_flutter/models/models/language_detail.dart';
import 'package:flutter/material.dart';

class BibleFilterProvider with ChangeNotifier {
  //ENGESV
  BibleData _selectedBible = sampleBibleData;
  //6411
  Language? _selectedLanguage;

  BibleVersion? _bibleVersion;

  BibleData? get selectedBible => _selectedBible;
  Language? get selectedLanguage => _selectedLanguage;
  BibleVersion? get bibleVersion => _bibleVersion;

  void setSelectedBible(BibleData bible) {
    _selectedBible = bible;
    notifyListeners();
  }

  void setSelectedLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void setTranslation(BibleVersion v) {
    _bibleVersion = v;
    notifyListeners();
  }
}
