// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum ImageSize {
  thumbnail,
  small,
  regular,
  large,
}

extension ImageSizeExtension on ImageSize {
  String get upperName => name.toUpperCase();
}

class RecipeParam {
  final String keyword;
  final ImageSize imageSize;

  RecipeParam({
    this.keyword = '',
    this.imageSize = ImageSize.regular,
  });

  RecipeParam copyWith({
    String? keyword,
    ImageSize? imageSize,
  }) {
    return RecipeParam(
      keyword: keyword ?? this.keyword,
      imageSize: imageSize ?? this.imageSize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'keyword': keyword,
      'imageSize': imageSize.upperName,
    };
  }

  factory RecipeParam.fromMap(Map<String, dynamic> map) {
    var imageSize = ImageSize.regular;
    for (final item in ImageSize.values) {
      if (item.name == map['imageSize'] as String) {
        imageSize = item;
        break;
      }
    }
    return RecipeParam(
      keyword: map['keyword'] as String,
      imageSize: imageSize,
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
