// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:recipe_app/domain/entity/images/image_item.dart';

class Images {
  Images({
    required this.thumbnail,
    required this.small,
    required this.regular,
    required this.large,
  });

  final ImageItem? thumbnail;
  final ImageItem? small;
  final ImageItem? regular;
  final ImageItem? large;

  Images copyWith({
    ImageItem? thumbnail,
    ImageItem? small,
    ImageItem? regular,
    ImageItem? large,
  }) {
    return Images(
      thumbnail: thumbnail ?? this.thumbnail,
      small: small ?? this.small,
      regular: regular ?? this.regular,
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumbnail': thumbnail?.toMap(),
      'small': small?.toMap(),
      'regular': regular?.toMap(),
      'large': large?.toMap(),
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    final thumbnail = map['thumbnail'] as Map<String, dynamic>?;
    final small = map['small'] as Map<String, dynamic>?;
    final regular = map['regular'] as Map<String, dynamic>?;
    final large = map['large'] as Map<String, dynamic>?;

    return Images(
      thumbnail: thumbnail != null ? ImageItem.fromMap(thumbnail) : null,
      small: small != null ? ImageItem.fromMap(small) : null,
      regular: regular != null ? ImageItem.fromMap(regular) : null,
      large: large != null ? ImageItem.fromMap(large) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) =>
      Images.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return toJson();
  }
}
