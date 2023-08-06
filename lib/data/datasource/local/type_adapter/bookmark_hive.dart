import 'package:hive/hive.dart';

part 'bookmark_hive.g.dart';

@HiveType(typeId: 1)
class Bookmark extends HiveObject {
  @HiveField(0)
  String name = '';

  @HiveField(1)
  String uri = '';

  @HiveField(2)
  String image = '';

  @HiveField(3)
  List<String> ingredientLines = [];

  @HiveField(4)
  List<String> cautions = [];
}
