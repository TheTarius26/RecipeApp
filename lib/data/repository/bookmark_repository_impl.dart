import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/datasource/local/bookmark/bookmark_local_service.dart';
import 'package:recipe_app/data/datasource/local/type_adapter/bookmark_hive.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

@Singleton(as: BookmarkRepository, order: 2)
class BookmarkRepositoryImpl implements BookmarkRepository {
  const BookmarkRepositoryImpl(this._bookmarkLocalService);

  final BookmarkLocalService _bookmarkLocalService;

  @override
  Future<void> addBookmark(Bookmark bookmark) async {
    await _bookmarkLocalService.add(bookmark);
  }

  @override
  Future<List<Bookmark>> getBookmarks() async {
    return _bookmarkLocalService.getAll();
  }

  @override
  Future<void> removeAllBookmarks() async {
    await _bookmarkLocalService.deleteAll();
  }

  @override
  Future<void> removeBookmark(Bookmark bookmark) async {
    final box = await _bookmarkLocalService.getAll();
    final index = box.indexWhere((element) => element.uri == bookmark.uri);
    await _bookmarkLocalService.delete(index);
  }
}
