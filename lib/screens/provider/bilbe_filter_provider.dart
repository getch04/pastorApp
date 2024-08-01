import 'package:churchapp_flutter/models/models/bibleApiResponse.dart';
import 'package:churchapp_flutter/models/models/country_data.dart';
import 'package:churchapp_flutter/models/models/language.dart';
import 'package:flutter/material.dart';

class BibleFilterProvider with ChangeNotifier {
  //ENGESV
  BibleData _selectedBible = sampleBibleData;
  //6411
  Language? _selectedLanguage;
  Country? _selectedCountry;

  BibleData? get selectedBible => _selectedBible;
  Language? get selectedLanguage => _selectedLanguage;
  Country? get selectedCountry => _selectedCountry;

  void setSelectedBible(BibleData bible) {
    _selectedBible = bible;
    notifyListeners();
  }

  void setSelectedLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }
}
