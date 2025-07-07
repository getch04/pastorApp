import 'package:churchapp_flutter/models/Media.dart';

class ScreenArguements {
  int? position;
  Object? items;
  List<Object?>? itemsList;
  bool? check;
  String? option;
  Media? localSermon;

  ScreenArguements({
    this.position,
    this.items,
    this.itemsList,
    this.check,
    this.option,
    this.localSermon,
  });
}
