import 'package:dio/dio.dart';
import 'package:movie_search/shared/network_interceptor.dart';

const String _baseUrl = 'https://api.kinopoisk.dev/v1.2/movie';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(BaseOptions(
          baseUrl: _baseUrl,
          receiveTimeout: const Duration(seconds: 60),
          connectTimeout: const Duration(seconds: 60),
        ))
          ..interceptors.addAll([
            LogInterceptor(responseBody: true),
            NetworkInterceptor(),
          ]);
}
