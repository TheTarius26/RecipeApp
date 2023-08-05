import 'dart:convert';

class Pagination {
  Pagination({
    required this.href,
    required this.title,
  });

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      href: map['href'] as String,
      title: map['title'] as String,
    );
  }

  factory Pagination.fromJson(String source) =>
      Pagination.fromMap(json.decode(source) as Map<String, dynamic>);

  final String href;
  final String title;

  Pagination copyWith({
    String? href,
    String? title,
  }) {
    return Pagination(
      href: href ?? this.href,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'href': href,
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Pagination(href: $href, title: $title)';

  @override
  bool operator ==(covariant Pagination other) {
    if (identical(this, other)) return true;

    return other.href == href && other.title == title;
  }

  @override
  int get hashCode => href.hashCode ^ title.hashCode;
}
