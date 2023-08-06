import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/datasource/local/type_adapter/bookmark_hive.dart';

@Singleton(order: 1)
class BookmarkLocalService {
  Future<List<Bookmark>> getAll() async {
    final box = await Hive.openBox<Bookmark>('bookmark');
    final bookmarks = box.values.toList();
    await box.compact();
    await box.close();
    return bookmarks;
  }

  Future<void> add(Bookmark bookmark) async {
    final box = await Hive.openBox<Bookmark>('bookmark');
    await box.add(bookmark);
    await box.compact();
    await box.close();
  }

  Future<void> delete(int index) async {
    final box = await Hive.openBox<Bookmark>('bookmark');
    await box.deleteAt(index);
    await box.compact();
    await box.close();
  }

  Future<void> deleteAll() async {
    final box = await Hive.openBox<Bookmark>('bookmark');
    await box.clear();
    await box.compact();
    await box.close();
  }

  Future<bool> isExist(String uri) async {
    final box = await Hive.openBox<Bookmark>('bookmark');
    final bookmarks = box.values.toList();
    final isExist = bookmarks.any((bookmark) => bookmark.uri == uri);
    await box.compact();
    await box.close();
    return isExist;
  }
}
