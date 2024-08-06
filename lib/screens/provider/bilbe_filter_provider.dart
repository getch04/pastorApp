import 'package:churchapp_flutter/models/models/bibleApiResponse.dart';
import 'package:churchapp_flutter/models/models/language.dart';
import 'package:flutter/material.dart';

class BibleFilterProvider with ChangeNotifier {
  //ENGESV
  BibleData _selectedBible = sampleBibleData;
  //6411
  Language? _selectedLanguage;

  BibleData? get selectedBible => _selectedBible;
  Language? get selectedLanguage => _selectedLanguage;

  void setSelectedBible(BibleData bible) {
    _selectedBible = bible;
    notifyListeners();
  }

  void setSelectedLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
