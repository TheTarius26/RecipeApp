// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/entity/pagination/pagination_link.dart';
import 'package:recipe_app/domain/entity/recipe/recipe.dart';

class RecipeResponse {
  final int from;
  final int to;
  final int count;
  final PaginationLink links;
  final List<Recipe> recipes;

  RecipeResponse({
    required this.from,
    required this.to,
    required this.count,
    required this.links,
    required this.recipes,
  });

  RecipeResponse copyWith({
    int? from,
    int? to,
    int? count,
    PaginationLink? links,
    List<Recipe>? recipes,
  }) {
    return RecipeResponse(
      from: from ?? this.from,
      to: to ?? this.to,
      count: count ?? this.count,
      links: links ?? this.links,
      recipes: recipes ?? this.recipes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'count': count,
      'links': links.toMap(),
      'recipes': recipes.map((x) => x.toMap()).toList(),
    };
  }

  factory RecipeResponse.fromMap(Map<String, dynamic> map) {
    return RecipeResponse(
      from: map['from'] as int,
      to: map['to'] as int,
      count: map['count'] as int,
      links: PaginationLink.fromMap(map['_links'] as Map<String, dynamic>),
      recipes: List<Recipe>.from(
        (map['hits'] as List<dynamic>).map(
          (x) {
            final item = x as Map<String, dynamic>;
            return Recipe.fromMap(item['recipe'] as Map<String, dynamic>);
          },
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeResponse.fromJson(Map<String, dynamic> map) =>
      RecipeResponse.fromMap(map);

  @override
  String toString() {
    return toJson();
  }

  @override
  bool operator ==(covariant RecipeResponse other) {
    if (identical(this, other)) return true;

    return other.from == from &&
        other.to == to &&
        other.count == count &&
        other.links == links &&
        listEquals(other.recipes, recipes);
  }

  @override
  int get hashCode {
    return from.hashCode ^
        to.hashCode ^
        count.hashCode ^
        links.hashCode ^
        recipes.hashCode;
  }
}
