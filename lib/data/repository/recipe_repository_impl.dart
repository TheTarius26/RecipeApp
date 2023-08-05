import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/core/resource/app_error.dart';
import 'package:recipe_app/core/utils/logger.dart';
import 'package:recipe_app/data/datasource/remote/recipe/recipe_remote_service.dart';
import 'package:recipe_app/data/model/recipe/recipe_response.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

@Singleton(
  as: RecipeRepository,
  order: 2,
)
class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl(
    this._recipeRemoteService,
  );

  final RecipeRemoteService _recipeRemoteService;

  @override
  Future<Either<AppError, RecipeResponse>> getRecipes({
    required String keyword,
    String imageSize = 'SMALL',
  }) async {
    try {
      final response = await _recipeRemoteService.getRecipes(
        keyword: keyword,
        imageSize: imageSize,
      );
      return Right(response.data);
    } on DioException catch (e) {
      loggerDebug(e.requestOptions.queryParameters.toString());
      return Left(
        AppError(
          code: ErrorCode.network,
          message: e.response?.data.toString() ?? '',
        ),
      );
    }
  }
}
