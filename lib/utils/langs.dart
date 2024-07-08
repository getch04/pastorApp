enum AppLanguage {
  English, // usa
  Bengali,
  Dzongkha,
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
  AppLanguage.English: {"value": "en", "name": "English"},
  AppLanguage.Bengali: {"value": "bn", "name": "Bengali"},
  AppLanguage.Dzongkha: {"value": "dz", "name": "Dzongkha"},
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
