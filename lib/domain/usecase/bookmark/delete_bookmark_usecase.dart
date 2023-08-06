import 'package:injectable/injectable.dart';
import 'package:recipe_app/core/resource/use_case.dart';
import 'package:recipe_app/data/datasource/local/type_adapter/bookmark_hive.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

@Singleton(order: 3)
class DeleteBookmarkUseCase implements UseCase<void, Bookmark> {
  DeleteBookmarkUseCase(this._repository);

  final BookmarkRepository _repository;

  @override
  Future<void> call(Bookmark params) async {
    return _repository.removeBookmark(params);
  }
}
