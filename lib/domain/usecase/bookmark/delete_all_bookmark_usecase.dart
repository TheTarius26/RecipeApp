import 'package:injectable/injectable.dart';
import 'package:recipe_app/core/resource/use_case.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

@Singleton(order: 3)
class DeleteAllBookmarkUseCase implements UseCase<void, String> {
  DeleteAllBookmarkUseCase(this._repository);

  final BookmarkRepository _repository;

  @override
  Future<void> call([String? params]) async {
    return _repository.removeAllBookmarks();
  }
}
