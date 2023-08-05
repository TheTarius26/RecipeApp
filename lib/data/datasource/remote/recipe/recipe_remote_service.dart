import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/model/recipe/recipe_response.dart';
import 'package:retrofit/retrofit.dart';

part 'recipe_remote_service.g.dart';

@RestApi()
@Singleton(order: 1)
abstract class RecipeRemoteService {
  @factoryMethod
  factory RecipeRemoteService(Dio dio) = _RecipeRemoteService;

  @GET('')
  Future<HttpResponse<RecipeResponse>> getRecipes({
    @Query('q') required String keyword,
    @Query('imageSize') String imageSize = 'SMALL',
  });
}
