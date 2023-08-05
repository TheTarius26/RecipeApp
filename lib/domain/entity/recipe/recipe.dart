// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/entity/images/images.dart';
import 'package:recipe_app/domain/entity/recipe/ingredient.dart';

class Recipe {
  Recipe({
    required this.uri,
    required this.label,
    required this.image,
    required this.images,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.yield,
    required this.dietLabels,
    required this.healthLabels,
    required this.cautions,
    required this.ingredientLines,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });
  final String uri;
  final String label;
  final String image;
  final Images images;
  final String source;
  final String url;
  final String shareAs;
  final double yield;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<String> cautions;
  final List<String> ingredientLines;
  final List<Ingredient> ingredients;
  final double calories;
  final double totalWeight;
  final double totalTime;
  final List<String> cuisineType;
  final List<String> mealType;
  final List<String> dishType;

  Recipe copyWith({
    String? uri,
    String? label,
    String? image,
    Images? images,
    String? source,
    String? url,
    String? shareAs,
    double? yield,
    List<String>? dietLabels,
    List<String>? healthLabels,
    List<String>? cautions,
    List<String>? ingredientLines,
    List<Ingredient>? ingredients,
    double? calories,
    double? totalCO2Emissions,
    String? co2EmissionsClass,
    double? totalWeight,
    double? totalTime,
    List<String>? cuisineType,
    List<String>? mealType,
    List<String>? dishType,
  }) {
    return Recipe(
      uri: uri ?? this.uri,
      label: label ?? this.label,
      image: image ?? this.image,
      images: images ?? this.images,
      source: source ?? this.source,
      url: url ?? this.url,
      shareAs: shareAs ?? this.shareAs,
      yield: yield ?? this.yield,
      dietLabels: dietLabels ?? this.dietLabels,
      healthLabels: healthLabels ?? this.healthLabels,
      cautions: cautions ?? this.cautions,
      ingredientLines: ingredientLines ?? this.ingredientLines,
      ingredients: ingredients ?? this.ingredients,
      calories: calories ?? this.calories,
      totalWeight: totalWeight ?? this.totalWeight,
      totalTime: totalTime ?? this.totalTime,
      cuisineType: cuisineType ?? this.cuisineType,
      mealType: mealType ?? this.mealType,
      dishType: dishType ?? this.dishType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uri': uri,
      'label': label,
      'image': image,
      'images': images.toMap(),
      'source': source,
      'url': url,
      'shareAs': shareAs,
      'yield': yield,
      'dietLabels': dietLabels,
      'healthLabels': healthLabels,
      'cautions': cautions,
      'ingredientLines': ingredientLines,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'calories': calories,
      'totalWeight': totalWeight,
      'totalTime': totalTime,
      'cuisineType': cuisineType,
      'mealType': mealType,
      'dishType': dishType,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
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
        (map['ingredients'] as List<dynamic>).map<Ingredient>(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
      calories: map['calories'] as double,
      totalWeight: map['totalWeight'] as double,
      totalTime: map['totalTime'] as double,
      cuisineType: List<String>.from(map['cuisineType'] as List<dynamic>),
      mealType: List<String>.from(map['mealType'] as List<dynamic>),
      dishType: List<String>.from(map['dishType'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) =>
      Recipe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Recipe(uri: $uri, label: $label, image: $image, images: $images, source: $source, url: $url, shareAs: $shareAs, yield: $yield, dietLabels: $dietLabels, healthLabels: $healthLabels, cautions: $cautions, ingredientLines: $ingredientLines, ingredients: $ingredients, calories: $calories, totalWeight: $totalWeight, totalTime: $totalTime, cuisineType: $cuisineType, mealType: $mealType, dishType: $dishType)';
  }

  @override
  bool operator ==(covariant Recipe other) {
    if (identical(this, other)) return true;

    return other.uri == uri &&
        other.label == label &&
        other.image == image &&
        other.images == images &&
        other.source == source &&
        other.url == url &&
        other.shareAs == shareAs &&
        other.yield == yield &&
        listEquals(other.dietLabels, dietLabels) &&
        listEquals(other.healthLabels, healthLabels) &&
        listEquals(other.cautions, cautions) &&
        listEquals(other.ingredientLines, ingredientLines) &&
        listEquals(other.ingredients, ingredients) &&
        other.calories == calories &&
        other.totalWeight == totalWeight &&
        other.totalTime == totalTime &&
        listEquals(other.cuisineType, cuisineType) &&
        listEquals(other.mealType, mealType) &&
        listEquals(other.dishType, dishType);
  }

  @override
  int get hashCode {
    return uri.hashCode ^
        label.hashCode ^
        image.hashCode ^
        images.hashCode ^
        source.hashCode ^
        url.hashCode ^
        shareAs.hashCode ^
        yield.hashCode ^
        dietLabels.hashCode ^
        healthLabels.hashCode ^
        cautions.hashCode ^
        ingredientLines.hashCode ^
        ingredients.hashCode ^
        calories.hashCode ^
        totalWeight.hashCode ^
        totalTime.hashCode ^
        cuisineType.hashCode ^
        mealType.hashCode ^
        dishType.hashCode;
  }
}
