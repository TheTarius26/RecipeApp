import 'package:injectable/injectable.dart';
import 'package:recipe_app/core/resource/use_case.dart';
import 'package:recipe_app/data/datasource/local/type_adapter/bookmark_hive.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

@Singleton(order: 3)
class GettAllBookmarkUseCase implements UseCase<List<Bookmark>, String> {
  GettAllBookmarkUseCase(this._repository);

  final BookmarkRepository _repository;

  @override
  Future<List<Bookmark>> call([String? params]) async {
    return _repository.getBookmarks();
  }
}
