import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@Singleton(
  as: Dio,
  order: 0,
)
class DioClient extends DioForNative {
  DioClient() {
    final env = dotenv.env;
    options
      ..baseUrl = 'https://api.edamam.com/api/recipes/v2'
      ..queryParameters = {
        'app_id': env['APP_ID'],
        'app_key': env['APP_KEY'],
        'type': 'public',
      };
  }
}
