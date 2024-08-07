import 'package:churchapp_flutter/models/models/language.dart';
import 'package:churchapp_flutter/models/models/language_detail.dart';
import 'package:flutter/material.dart';

class BibleFilterProvider with ChangeNotifier {
  Language? _selectedLanguage;

  BibleVersion _bibleVersion = defaultBibleVersion;

  String _selectedType = 'OT';

  Language? get selectedLanguage => _selectedLanguage;
  BibleVersion get bibleVersion => _bibleVersion;
  String get selectedType => _selectedType;

  void setSelectedLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void setTranslation(BibleVersion v) {
    _bibleVersion = v;
    notifyListeners();
  }

  void setSelectedType(String type) {
    _selectedType = type;
    notifyListeners();
  }
}
