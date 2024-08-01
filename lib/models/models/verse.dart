class Verse {
  final String? filesetId;
  final String bookId;
  final String bookName;
  final String bookNameAlt;
  final int chapter;
  final String chapterAlt;
  final int verseStart;
  final String verseStartAlt;
  final int verseEnd;
  final String verseEndAlt;
  final String verseText;

  Verse({
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

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
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
}
