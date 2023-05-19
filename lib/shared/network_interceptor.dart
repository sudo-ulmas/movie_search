import 'dart:async';

import 'package:dio/dio.dart';

import 'base_api.dart';

class NetworkInterceptor extends Interceptor with BaseApi<String> {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    const accessToken = '2ZER76H-AN9MW1K-MY8106R-3GAJ3RT';

    options.headers['X-API-KEY'] = accessToken;

    return handler.next(options);
  }
}
