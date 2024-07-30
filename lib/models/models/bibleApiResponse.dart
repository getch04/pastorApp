class BibleApiResponse {
  final String id;
  final String name;
  final String language;
  final List<Fileset> filesets;

  BibleApiResponse({
    required this.id,
    required this.name,
    required this.language,
    required this.filesets,
  });

  factory BibleApiResponse.fromJson(Map<String, dynamic> json) {
    var filesetsJson = json['filesets']['dbp-prod'] as List;
    List<Fileset> filesetList = filesetsJson.map((i) => Fileset.fromJson(i)).toList();

    return BibleApiResponse(
      id: json['abbr'],
      name: json['name'],
      language: json['language'],
      filesets: filesetList,
    );
  }
}

class Fileset {
  final String id;
  final String type;
  final String size;
  final String codec;
  final String container;
  final String volume;

  Fileset({
    required this.id,
    required this.type,
    required this.size,
    required this.codec,
    required this.container,
    required this.volume,
  });

  factory Fileset.fromJson(Map<String, dynamic> json) {
    return Fileset(
      id: json['id'],
      type: json['type'],
      size: json['size'],
      codec: json['codec'] ?? '',
      container: json['container'] ?? '',
      volume: json['volume'],
    );
  }
}
