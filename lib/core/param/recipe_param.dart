// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RecipeParam {
  final String keyword;
  final String imageSize;
  RecipeParam({
    required this.keyword,
    this.imageSize = 'SMALL',
  });

  RecipeParam copyWith({
    String? keyword,
    String? imageSize,
  }) {
    return RecipeParam(
      keyword: keyword ?? this.keyword,
      imageSize: imageSize ?? this.imageSize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'keyword': keyword,
      'imageSize': imageSize,
    };
  }

  factory RecipeParam.fromMap(Map<String, dynamic> map) {
    return RecipeParam(
      keyword: map['keyword'] as String,
      imageSize: map['imageSize'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeParam.fromJson(String source) =>
      RecipeParam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RecipeParam(keyword: $keyword, imageSize: $imageSize)';

  @override
  bool operator ==(covariant RecipeParam other) {
    if (identical(this, other)) return true;

    return other.keyword == keyword && other.imageSize == imageSize;
  }

  @override
  int get hashCode => keyword.hashCode ^ imageSize.hashCode;
}
