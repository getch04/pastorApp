class BibleApiResponse {
  final List<BibleData> data;
  final PaginationMeta meta;

  BibleApiResponse({
    required this.data,
    required this.meta,
  });

  factory BibleApiResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<BibleData> bibleDataList =
        dataList.map((i) => BibleData.fromJson(i)).toList();

    return BibleApiResponse(
      data: bibleDataList,
      meta: PaginationMeta.fromJson(json['meta']),
    );
  }
}

class BibleData {
  final String abbr;
  final String name;
  final String? vname;
  final String language;
  final String autonym;
  final int languageId;
  final String iso;
  final String? date;
  final List<Fileset> filesets;

  BibleData({
    required this.abbr,
    required this.name,
    this.vname,
    required this.language,
    required this.autonym,
    required this.languageId,
    required this.iso,
    this.date,
    required this.filesets,
  });

  factory BibleData.fromJson(Map<String, dynamic> json) {
    var filesetsJson = json['filesets']['dbp-prod'] as List?;
    List<Fileset> filesetList =
        filesetsJson?.map((i) => Fileset.fromJson(i)).toList() ?? [];

    return BibleData(
      abbr: json['abbr'],
      name: json['name'],
      vname: json['vname'],
      language: json['language'],
      autonym: json['autonym'],
      languageId: json['language_id'],
      iso: json['iso'],
      date: json['date'],
      filesets: filesetList,
    );
  }
}

class Fileset {
  final String id;
  final String type;
  final String size;
  final String? bitrate;

  Fileset({
    required this.id,
    required this.type,
    required this.size,
    this.bitrate,
  });

  factory Fileset.fromJson(Map<String, dynamic> json) {
    return Fileset(
      id: json['id'],
      type: json['type'],
      size: json['size'],
      bitrate: json['bitrate'],
    );
  }
}

class PaginationMeta {
  final int total;
  final int? count;
  final int perPage;
  final int currentPage;
  final int? totalPages;
  final List<dynamic>? links;

  PaginationMeta({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      total: json['pagination']['total'],
      count: json['pagination']['count'],
      perPage: json['pagination']['per_page'],
      currentPage: json['pagination']['current_page'],
      totalPages: json['pagination']['total_pages'],
      links: json['pagination']['links'] as List<dynamic>?,
    );
  }
}

final BibleData sampleBibleData = BibleData(
  abbr: "ENGESV",
  name: "English Standard Version® - Hear the Word Audio Bible",
  vname: null,
  language: "English: USA",
  autonym: "English",
  languageId: 17045,
  iso: "eng",
  date: null,
  filesets: [
    Fileset(
      id: "ENGESH",
      type: "text_format",
      size: "C",
      bitrate: null,
    ),
    Fileset(
      id: "ENGESVO1DA",
      type: "audio",
      size: "NT",
      bitrate: "16kbps",
    ),
    Fileset(
      id: "ENGESHN1DA",
      type: "audio",
      size: "NT",
      bitrate: "64kbps",
    ),
    Fileset(
      id: "ENGESH",
      type: "text_plain",
      size: "C",
      bitrate: null,
    ),
    Fileset(
      id: "ENGESHN1SA",
      type: "audio_stream",
      size: "NT",
      bitrate: null,
    ),
  ],
);
