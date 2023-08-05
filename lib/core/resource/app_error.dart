// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppError implements Exception {
  final String message;
  final ErrorCode? code;

  AppError({
    required this.code,
    this.message = '',
  });

  @override
  String toString() => 'AppError(message: $message, code: $code)';
}

enum ErrorCode {
  network,
  local,
}
