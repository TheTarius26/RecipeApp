// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ingredient {
  Ingredient({
    required this.text,
    required this.quantity,
    required this.food,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    this.image,
    this.measure,
  });

  final String text;
  final double quantity;
  final String? measure;
  final String food;
  final double weight;
  final String foodCategory;
  final String foodId;
  final String? image;

  Ingredient copyWith({
    String? text,
    double? quantity,
    String? measure,
    String? food,
    double? weight,
    String? foodCategory,
    String? foodId,
    String? image,
  }) {
    return Ingredient(
      text: text ?? this.text,
      quantity: quantity ?? this.quantity,
      measure: measure ?? this.measure,
      food: food ?? this.food,
      weight: weight ?? this.weight,
      foodCategory: foodCategory ?? this.foodCategory,
      foodId: foodId ?? this.foodId,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'quantity': quantity,
      'measure': measure,
      'food': food,
      'weight': weight,
      'foodCategory': foodCategory,
      'foodId': foodId,
      'image': image,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      text: map['text'] as String,
      quantity: map['quantity'] as double,
      measure: map['measure'] as String?,
      food: map['food'] as String,
      weight: map['weight'] as double,
      foodCategory: map['foodCategory'] as String,
      foodId: map['foodId'] as String,
      image: map['image'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source) as Map<String, dynamic>);
}
