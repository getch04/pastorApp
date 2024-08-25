enum AppLanguage {
  English, // usa
  Bengali,
  Dzongkha,
  // French,
  Hindi,
  Indonesian,
  Kannada,
  Marathi,
  Nepali,
  Oriya,
  // Portuguese,
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
  AppLanguage.English: {"value": "en", "name": "English"},
  AppLanguage.Bengali: {"value": "bn", "name": "বাংলা"},
  AppLanguage.Dzongkha: {"value": "dz", "name": "རྫོང་ཁ"},
  // AppLanguage.French: {"value": "fr", "name": "Français"},
  AppLanguage.Hindi: {"value": "hi", "name": "हिन्दी"},
  AppLanguage.Indonesian: {"value": "id", "name": "Bahasa Indonesia"},
  AppLanguage.Kannada: {"value": "kn", "name": "ಕನ್ನಡ"},
  AppLanguage.Marathi: {"value": "mr", "name": "मराठी"},
  AppLanguage.Nepali: {"value": "ne", "name": "नेपाली"},
  AppLanguage.Oriya: {"value": "or", "name": "ଓଡ଼ିଆ"},
  // AppLanguage.Portuguese: {"value": "pt", "name": "Português"},
  AppLanguage.Punjabi: {"value": "pa", "name": "ਪੰਜਾਬੀ"},
  AppLanguage.Spanish: {"value": "es", "name": "Español"},
  AppLanguage.Tamil: {"value": "ta", "name": "தமிழ்"},
  AppLanguage.Telugu: {"value": "te", "name": "తెలుగు"},
  AppLanguage.Urdu: {"value": "ur", "name": "اردو"},
};

