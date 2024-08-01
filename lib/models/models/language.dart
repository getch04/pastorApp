class Language {
  final int id;
  final String? glottoId;
  final String iso;
  final String name;
  final String? autonym;
  final int bibles;
  final int filesets;
  final String? rolvCode;
  final String? deletedAt;

  Language({
    required this.id,
    required this.glottoId,
    required this.iso,
    required this.name,
    required this.autonym,
    required this.bibles,
    required this.filesets,
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
      bibles: json['bibles'],
      filesets: json['filesets'],
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
      'bibles': bibles,
      'filesets': filesets,
      'rolv_code': rolvCode,
      'deleted_at': deletedAt,
    };
  }
}
