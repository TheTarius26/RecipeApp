// ignore_for_file: one_member_abstracts

import 'package:either_dart/either.dart';
import 'package:recipe_app/core/resource/app_error.dart';
import 'package:recipe_app/data/model/recipe/recipe_response.dart';

abstract class RecipeRepository {
  Future<Either<AppError, RecipeResponse>> getRecipes({
    required String keyword,
    String imageSize = 'SMALL',
  });
}
