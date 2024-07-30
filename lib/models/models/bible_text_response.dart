class BibleText {
  final String? filesetId;
  final String? bookId;
  final String? bookName;
  final String? bookNameAlt;
  final int? chapter;
  final String? chapterAlt;
  final int verseStart;
  final String? verseStartAlt;
  final int verseEnd;
  final String? verseEndAlt;
  final String verseText;

  BibleText({
    required this.filesetId,
    required this.bookId,
    required this.bookName,
    required this.bookNameAlt,
    required this.chapter,
    required this.chapterAlt,
    required this.verseStart,
    required this.verseStartAlt,
    required this.verseEnd,
    required this.verseEndAlt,
    required this.verseText,
  });

  factory BibleText.fromJson(Map<String, dynamic> json) {
    return BibleText(
      filesetId: json['fileset_id'],
      bookId: json['book_id'],
      bookName: json['book_name'],
      bookNameAlt: json['book_name_alt'],
      chapter: json['chapter'],
      chapterAlt: json['chapter_alt'],
      verseStart: json['verse_start'],
      verseStartAlt: json['verse_start_alt'],
      verseEnd: json['verse_end'],
      verseEndAlt: json['verse_end_alt'],
      verseText: json['verse_text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileset_id': filesetId,
      'book_id': bookId,
      'book_name': bookName,
      'book_name_alt': bookNameAlt,
      'chapter': chapter,
      'chapter_alt': chapterAlt,
      'verse_start': verseStart,
      'verse_start_alt': verseStartAlt,
      'verse_end': verseEnd,
      'verse_end_alt': verseEndAlt,
      'verse_text': verseText,
    };
  }
}

class BibleTextData {
  final List<BibleText> data;

  BibleTextData({required this.data});

  factory BibleTextData.fromJson(Map<String, dynamic> json) {
    return BibleTextData(
      data: List<BibleText>.from(
          json['data'].map((item) => BibleText.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
