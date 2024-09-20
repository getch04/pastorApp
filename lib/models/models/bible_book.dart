class BibleBook {
  final String bookId;
  final String bookIdUsfx;
  final String bookIdOsis;
  final String name;
  final String testament;
  final int testamentOrder;
  final String bookOrder;
  final String bookGroup;
  final String nameShort;
  final List<int> chapters;

  BibleBook({
    required this.bookId,
    required this.bookIdUsfx,
    required this.bookIdOsis,
    required this.name,
    required this.testament,
    required this.testamentOrder,
    required this.bookOrder,
    required this.bookGroup,
    required this.nameShort,
    required this.chapters,
  });

  factory BibleBook.fromJson(Map<String, dynamic> json) {
    return BibleBook(
      bookId: json['book_id'],
      bookIdUsfx: json['book_id_usfx'],
      bookIdOsis: json['book_id_osis'],
      name: json['name'],
      testament: json['testament'],
      testamentOrder: json['testament_order'],
      bookOrder: json['book_order'],
      bookGroup: json['book_group'],
      nameShort: json['name_short'],
      chapters: List<int>.from(json['chapters']),
    );
  }
}
