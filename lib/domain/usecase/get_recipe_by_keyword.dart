// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:recipe_app/core/param/recipe_param.dart';
import 'package:recipe_app/core/resource/use_case.dart';
import 'package:recipe_app/data/model/recipe/recipe_response.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

@Singleton(order: 3)
class GetRecipeByKeyword implements UseCase<RecipeResponse, RecipeParam> {
  GetRecipeByKeyword(
    this._recipeRepository,
  );

  final RecipeRepository _recipeRepository;

  @override
  Future<RecipeResponse> call(RecipeParam params) async {
    final result = await _recipeRepository.getRecipes(
      keyword: params.keyword,
      imageSize: params.imageSize,
    );
    return result.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}
