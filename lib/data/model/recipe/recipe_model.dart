import 'dart:convert';

import 'package:recipe_app/domain/entity/images/images.dart';
import 'package:recipe_app/domain/entity/recipe/ingredient.dart';
import 'package:recipe_app/domain/entity/recipe/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required super.uri,
    required super.label,
    required super.image,
    required super.images,
    required super.source,
    required super.url,
    required super.shareAs,
    required super.yield,
    required super.dietLabels,
    required super.healthLabels,
    required super.cautions,
    required super.ingredientLines,
    required super.ingredients,
    required super.calories,
    required super.totalWeight,
    required super.totalTime,
    required super.cuisineType,
    required super.mealType,
    required super.dishType,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      uri: map['uri'] as String,
      label: map['label'] as String,
      image: map['image'] as String,
      images: Images.fromMap(map['images'] as Map<String, dynamic>),
      source: map['source'] as String,
      url: map['url'] as String,
      shareAs: map['shareAs'] as String,
      yield: map['yield'] as double,
      dietLabels: List<String>.from(map['dietLabels'] as List<dynamic>),
      healthLabels: List<String>.from(map['healthLabels'] as List<dynamic>),
      cautions: List<String>.from(map['cautions'] as List<dynamic>),
      ingredientLines:
          List<String>.from(map['ingredientLines'] as List<dynamic>),
      ingredients: List<Ingredient>.from(
        (map['ingredients'] as List<dynamic>)
            .map((dynamic x) => Ingredient.fromMap(x as Map<String, dynamic>))
            .toList(),
      ),
      calories: map['calories'] as double,
      totalWeight: map['totalWeight'] as double,
      totalTime: map['totalTime'] as double,
      cuisineType: List<String>.from(map['cuisineType'] as List<dynamic>),
      mealType: List<String>.from(map['mealType'] as List<dynamic>),
      dishType: List<String>.from(map['dishType'] as List<dynamic>),
    );
  }

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
