class BibleVersion {
  String abbr;
  String name;
  String? vname;
  String language;
  String? autonym;
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

  BibleVersion copyWith({
    String? abbr,
    String? name,
    String? vname,
    String? language,
    String? autonym,
    int? languageId,
    String? languageRolvCode,
    String? iso,
    String? date,
    Map<String, List<Fileset>>? filesets,
  }) {
    return BibleVersion(
      abbr: abbr ?? this.abbr,
      name: name ?? this.name,
      vname: vname ?? this.vname,
      language: language ?? this.language,
      autonym: autonym ?? this.autonym,
      languageId: languageId ?? this.languageId,
      languageRolvCode: languageRolvCode ?? this.languageRolvCode,
      iso: iso ?? this.iso,
      date: date ?? this.date,
      filesets: filesets ?? this.filesets,
    );
  }

  // Method to get the first fileset id with type of "text_plain" or "text" and specific size
  String? getTextFilesetId(String size) {
    if (filesets.containsKey('dbp-prod')) {
      List<Fileset> filteredFilesets = filesets['dbp-prod']
              ?.where((val) => val.type.toString().startsWith('text'))
              .where((fileset) {
            // Exclude 'NT' if the size is 'OT' and vice versa
            if (size.toUpperCase() == 'OT' &&
                fileset.size.toUpperCase() == 'NT') {
              return false;
            }
            if (size.toUpperCase() == 'NT' &&
                fileset.size.toUpperCase() == 'OT') {
              return false;
            }
            // Include all other sizes or matching sizes
            return true;
          }).toList() ??
          [];

      // Prioritize 'text' over other types, followed by 'text_plain', 'text_format', and 'text_json'
      for (var preferredType in [
        'text',
        'text_plain',
        'text_format',
        'text_json'
      ]) {
        for (var fileset in filteredFilesets) {
          if (fileset.type == preferredType) {
            return fileset.id;
          }
        }
      }

      // If no 'text' fileset is found, return any other fileset that starts with 'text'
      for (var fileset in filteredFilesets) {
        if (fileset.type.startsWith('text')) {
          return fileset.id;
        }
      }
    }
    return null;
  }

  List<String> getTextFilesetIds(String size) {
    List<String> filesetIds = [];

    if (filesets.containsKey('dbp-prod')) {
      List<Fileset> filteredFilesets = filesets['dbp-prod']
              ?.where((val) => val.type.toString().startsWith('text'))
              .where((fileset) {
            // Exclude 'NT' if the size is 'OT' and vice versa
            if (size.toUpperCase() == 'OT' &&
                fileset.size.toUpperCase() == 'NT') {
              return false;
            }
            if (size.toUpperCase() == 'NT' &&
                fileset.size.toUpperCase() == 'OT') {
              return false;
            }
            // Include all other sizes or matching sizes
            return true;
          }).toList() ??
          [];

      // Prioritize 'text' over other types, followed by 'text_plain', 'text_format', and 'text_json'
      for (var preferredType in [
        'text',
        'text_plain',
        'text_format',
        'text_json'
      ]) {
        for (var fileset in filteredFilesets) {
          if (fileset.type == preferredType) {
            filesetIds.add(fileset.id);
          }
        }
      }

      // If no 'text' fileset is found, add any other fileset that starts with 'text'
      for (var fileset in filteredFilesets) {
        if (fileset.type.startsWith('text') &&
            !filesetIds.contains(fileset.id)) {
          filesetIds.add(fileset.id);
        }
      }
    }

    return filesetIds;
  }

  // Method to get the first fileset id with type of "audio" and specific size
  String? getAudioFilesetId(String size) {
    if (filesets.containsKey('dbp-prod')) {
      List<Fileset> filteredFilesets = filesets['dbp-prod']!
          .where((fileset) =>
              (fileset.type.startsWith('audio') && fileset.size == size))
          .toList();

      // Prioritize based on bitrate, container, and codec
      filteredFilesets.sort((a, b) {
        int bitrateComparison = compareBitrate(a.bitrate, b.bitrate);
        if (bitrateComparison != 0) return bitrateComparison;

        int containerComparison = compareContainer(a.container, b.container);
        if (containerComparison != 0) return containerComparison;

        return compareCodec(a.codec, b.codec);
      });

      // Return the highest priority fileset ID
      if (filteredFilesets.isNotEmpty) {
        return filteredFilesets.first.id;
      }
    }
    return null;
  }

// Compare bitrates (higher bitrate is preferred)
  int compareBitrate(String? bitrateA, String? bitrateB) {
    if (bitrateA == null && bitrateB == null) return 0;
    if (bitrateA == null) return 1; // Null is less preferred
    if (bitrateB == null) return -1; // Null is less preferred

    int bitrateValueA =
        int.tryParse(bitrateA.replaceAll(RegExp(r'\D'), '')) ?? 0;
    int bitrateValueB =
        int.tryParse(bitrateB.replaceAll(RegExp(r'\D'), '')) ?? 0;

    return bitrateValueB.compareTo(bitrateValueA); // Higher bitrate preferred
  }

// Compare containers (specific order of preference)
  int compareContainer(String? containerA, String? containerB) {
    List<String> preferredOrder = ['mp4', 'webm', 'hls'];

    if (containerA == null && containerB == null) return 0;
    if (containerA == null) return 1; // Null is less preferred
    if (containerB == null) return -1; // Null is less preferred

    int indexA = preferredOrder.indexOf(containerA);
    int indexB = preferredOrder.indexOf(containerB);

    if (indexA == -1 && indexB == -1) return 0;
    if (indexA == -1) return 1; // Unknown containers are less preferred
    if (indexB == -1) return -1; // Unknown containers are less preferred

    return indexA
        .compareTo(indexB); // Lower index (higher preference) preferred
  }

// Compare codecs (specific order of preference)
  int compareCodec(String? codecA, String? codecB) {
    List<String> preferredOrder = ['aac', 'opus', 'mp4'];

    if (codecA == null && codecB == null) return 0;
    if (codecA == null) return 1; // Null is less preferred
    if (codecB == null) return -1; // Null is less preferred

    int indexA = preferredOrder.indexOf(codecA);
    int indexB = preferredOrder.indexOf(codecB);

    if (indexA == -1 && indexB == -1) return 0;
    if (indexA == -1) return 1; // Unknown codecs are less preferred
    if (indexB == -1) return -1; // Unknown codecs are less preferred

    return indexA
        .compareTo(indexB); // Lower index (higher preference) preferred
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

BibleVersion defaultBibleVersion = BibleVersion(
  abbr: "ENGESV",
  name: "English Standard Version",
  vname: "English Standard Version",
  language: "English: USA",
  autonym: "English",
  languageId: 17045,
  languageRolvCode: null,
  iso: "eng",
  date: "2001",
  filesets: {
    "dbp-prod": [
      Fileset(
        id: "ENGESVN1DA-opus16",
        type: "audio",
        size: "NT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVN_ET-json",
        type: "text_json",
        size: "NT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVO1DA-opus16",
        type: "audio",
        size: "OT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVN2DA",
        type: "audio_drama",
        size: "NT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVO2DA-opus16",
        type: "audio_drama",
        size: "OT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVO2DA",
        type: "audio_drama",
        size: "OT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVO_ET-json",
        type: "text_json",
        size: "OT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVO_ET",
        type: "text_plain",
        size: "OT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVO1DA",
        type: "audio",
        size: "OT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
      Fileset(
        id: "ENGESVN_ET",
        type: "text_plain",
        size: "NT",
        stockNo: null,
        volume: "English Standard Version",
        bitrate: null,
        codec: null,
        container: null,
      ),
    ],
  },
);
