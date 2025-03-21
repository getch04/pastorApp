class Language {
  final dynamic id;
  final String? glottoId;
  final String iso;
  final String name;
  final String? autonym;
  final String? rolvCode;
  final String? deletedAt;

  Language({
    required this.id,
    required this.glottoId,
    required this.iso,
    required this.name,
    required this.autonym,
    this.rolvCode,
    this.deletedAt,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'],
      glottoId: json['glotto_id'],
      iso: json['iso'],
      name: json['name'],
      autonym: json['autonym'],
      rolvCode: json['rolv_code'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'glotto_id': glottoId,
      'iso': iso,
      'name': name,
      'autonym': autonym,
      'rolv_code': rolvCode,
      'deleted_at': deletedAt,
    };
  }
}

final List<Language> languages = [
  Language(
    id: 748,
    glottoId: null,
    iso: "ben",
    name: "Bengali",
    autonym: "বাংলা",
  ),
  Language(
    id: 33689,
    glottoId: null,
    iso: "dzo",
    name: "Dzongkha",
    autonym: "རྫོང་ཁ",
  ),
  Language(
    id: 17045,
    glottoId: null,
    iso: "eng",
    name: "English (USA)",
    autonym: "English",
  ),
  Language(
    id: 2355,
    glottoId: null,
    iso: "hin",
    name: "Hindi",
    autonym: "हिन्दी",
  ),
  Language(
    id: 2534,
    glottoId: null,
    iso: "ind",
    name: "Indonesian",
    autonym: "Bahasa Indonesia",
  ),
  Language(
    id: 5049,
    glottoId: null,
    iso: "kan",
    name: "Kannada",
    autonym: "ಕನ್ನಡ",
  ),
  Language(
    id: 4100,
    glottoId: null,
    iso: "mar",
    name: "Marathi",
    autonym: "मराठी",
  ),
  Language(
    id: 4756,
    glottoId: null,
    iso: "npi",
    name: "Nepali",
    autonym: "नेपाली",
  ),
  Language(
    id: 8567,
    glottoId: null,
    iso: "ory",
    name: "Oriya",
    autonym: "ଓଡ଼ିଆ",
  ),
  Language(
    id: 8247,
    glottoId: null,
    iso: "pan",
    name: "Punjabi",
    autonym: "ਪੰਜਾਬੀ",
  ),
  Language(
    id: 6411,
    glottoId: null,
    iso: "spa",
    name: "Spanish (Mexico)",
    autonym: "Español",
  ),
  Language(
    id: 6589,
    glottoId: null,
    iso: "tam",
    name: "Tamil",
    autonym: "தமிழ்",
  ),
  Language(
    id: 6696,
    glottoId: null,
    iso: "tel",
    name: "Telugu",
    autonym: "తెలుగు",
  ),
  Language(
    id: 7147,
    glottoId: null,
    iso: "urd",
    name: "Urdu",
    autonym: "اردو",
  ),
];
