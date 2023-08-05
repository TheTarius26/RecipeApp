import 'dart:convert';

import 'package:recipe_app/domain/entity/pagination/pagination.dart';

class PaginationLink {
  PaginationLink({
    this.next,
  });

  factory PaginationLink.fromMap(Map<String, dynamic> map) {
    return PaginationLink(
      next: Pagination.fromMap(map['next'] as Map<String, dynamic>),
    );
  }

  factory PaginationLink.fromJson(String source) =>
      PaginationLink.fromMap(json.decode(source) as Map<String, dynamic>);

  final Pagination? next;

  PaginationLink copyWith({
    Pagination? next,
  }) {
    return PaginationLink(
      next: next ?? this.next,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'next': next?.toMap() ?? {},
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'PaginationLink(next: $next)';
}
