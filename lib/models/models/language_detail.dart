class BibleVersion {
  String abbr;
  String name;
  String? vname;
  String language;
  String autonym;
  int languageId;
  String? languageRolvCode;
  String iso;
  String? date;
  Map<String, List<Fileset>> filesets;

  BibleVersion({
    required this.abbr,
    required this.name,
    this.vname,
    required this.language,
    required this.autonym,
    required this.languageId,
    this.languageRolvCode,
    required this.iso,
    this.date,
    required this.filesets,
  });

  factory BibleVersion.fromJson(Map<String, dynamic> json) {
    var filesets = <String, List<Fileset>>{};
    (json['filesets'] as Map<String, dynamic>).forEach((key, value) {
      filesets[key] = (value as List).map((i) => Fileset.fromJson(i)).toList();
    });

    return BibleVersion(
      abbr: json['abbr'],
      name: json['name'],
      vname: json['vname'],
      language: json['language'],
      autonym: json['autonym'],
      languageId: json['language_id'],
      languageRolvCode: json['language_rolv_code'],
      iso: json['iso'],
      date: json['date'],
      filesets: filesets,
    );
  }

  Map<String, dynamic> toJson() {
    var filesetsMap = <String, dynamic>{};
    filesets.forEach((key, value) {
      filesetsMap[key] = value.map((i) => i.toJson()).toList();
    });

    return {
      'abbr': abbr,
      'name': name,
      'vname': vname,
      'language': language,
      'autonym': autonym,
      'language_id': languageId,
      'language_rolv_code': languageRolvCode,
      'iso': iso,
      'date': date,
      'filesets': filesetsMap,
    };
  }

  // Method to get the first fileset id with type of "text_plain" or "text"
  String? get getTextFilesetId {
    if (filesets.containsKey('dbp-prod')) {
      for (var fileset in filesets['dbp-prod']!) {
        if (fileset.type == 'text_plain' || fileset.type == 'text') {
          return fileset.id;
        }
      }
    }
    return null;
  }

  // Method to get the first fileset id with type of "audio"
  String? get getAudioFilesetId {
    if (filesets.containsKey('dbp-prod')) {
      for (var fileset in filesets['dbp-prod']!) {
        if (fileset.type == 'audio') {
          return fileset.id;
        }
      }
    }
    return null;
  }
}

class Fileset {
  String id;
  String type;
  String size;
  String? stockNo;
  String volume;
  String? bitrate;
  String? codec;
  String? container;

  Fileset({
    required this.id,
    required this.type,
    required this.size,
    this.stockNo,
    required this.volume,
    this.bitrate,
    this.codec,
    this.container,
  });

  factory Fileset.fromJson(Map<String, dynamic> json) {
    return Fileset(
      id: json['id'],
      type: json['type'],
      size: json['size'],
      stockNo: json['stock_no'],
      volume: json['volume'],
      bitrate: json['bitrate'],
      codec: json['codec'],
      container: json['container'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'size': size,
      'stock_no': stockNo,
      'volume': volume,
      'bitrate': bitrate,
      'codec': codec,
      'container': container,
    };
  }
}
