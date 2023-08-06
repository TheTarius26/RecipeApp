import 'package:recipe_app/data/datasource/local/type_adapter/bookmark_hive.dart';

abstract class BookmarkRepository {
  Future<List<Bookmark>> getBookmarks();
  Future<void> addBookmark(Bookmark bookmark);
  Future<void> removeBookmark(Bookmark bookmark);
  Future<void> removeAllBookmarks();
}
