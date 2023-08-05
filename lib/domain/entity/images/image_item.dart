import 'dart:convert';

class ImageItem {
  ImageItem({
    required this.url,
    required this.width,
    required this.height,
  });

  factory ImageItem.fromMap(Map<String, dynamic> map) {
    return ImageItem(
      url: map['url'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
    );
  }

  factory ImageItem.fromJson(Map<String, dynamic> map) =>
      ImageItem.fromMap(map);

  final String url;
  final int width;
  final int height;

  ImageItem copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return ImageItem(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ImageItem(url: $url, width: $width, height: $height)';
}
