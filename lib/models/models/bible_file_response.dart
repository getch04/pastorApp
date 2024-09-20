class BibleFile {
  final String bookId;
  final String bookName;
  final int? chapterStart;
  final int? chapterEnd;
  final int verseStart;
  final String? verseStartAlt;
  final int? verseEnd;
  final String? verseEndAlt;
  final String? timestamp;
  final String? path;
  final int? duration;
  final String? thumbnail;
  final int? filesizeInBytes;
  final String? youtubeUrl;

  BibleFile({
    required this.bookId,
    required this.bookName,
    required this.chapterStart,
    required this.chapterEnd,
    required this.verseStart,
    this.verseStartAlt,
    this.verseEnd,
    this.verseEndAlt,
    this.timestamp,
    required this.path,
    this.duration,
    this.thumbnail,
    required this.filesizeInBytes,
    this.youtubeUrl,
  });

  factory BibleFile.fromJson(Map<String, dynamic> json) {
    return BibleFile(
      bookId: json['book_id'] as String,
      bookName: json['book_name'] as String,
      chapterStart: json['chapter_start'] as int?,
      chapterEnd: json['chapter_end'] as int?,
      verseStart: json['verse_start'] as int,
      verseStartAlt: json['verse_start_alt'] as String?,
      verseEnd: json['verse_end'] as int?,
      verseEndAlt: json['verse_end_alt'] as String?,
      timestamp: json['timestamp'] as String?,
      path: json['path'] as String?,
      duration: json['duration'] as int?,
      thumbnail: json['thumbnail'] as String?,
      filesizeInBytes: json['filesize_in_bytes'] as int?,
      youtubeUrl: json['youtube_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book_id': bookId,
      'book_name': bookName,
      'chapter_start': chapterStart,
      'chapter_end': chapterEnd,
      'verse_start': verseStart,
      'verse_start_alt': verseStartAlt,
      'verse_end': verseEnd,
      'verse_end_alt': verseEndAlt,
      'timestamp': timestamp,
      'path': path,
      'duration': duration,
      'thumbnail': thumbnail,
      'filesize_in_bytes': filesizeInBytes,
      'youtube_url': youtubeUrl,
    };
  }
}

class BibleFileResponse {
  final List<BibleFile> data;

  BibleFileResponse({required this.data});

  factory BibleFileResponse.fromJson(Map<String, dynamic> json) {
    return BibleFileResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => BibleFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
