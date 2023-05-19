import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

mixin BaseApi<T> {
  Future<Either<String, T>> request(Future<T> Function() request) async {
    try {
      return Right(await request());
    } on DioError catch (e) {
      return Left(e.mapToNetworkException().errorMessage);
    } on Exception catch (e, stack) {
      log('[Request error] error: $e, stack: $stack');

      return Left(NetworkException.unknownError.errorMessage);
    }
  }
}

enum NetworkException {
  badRequest(),
  forbidden(errorMessage: 'Token is invalid'),
  requestTimeout(),
  serviceUnavailable(),
  internalServerError(),
  gatewayTimeout(),
  unknownError(),
  noInternetConnection(errorMessage: 'No Internet Connection!'),
  deadlineExceeded(errorMessage: 'Deadline Exceeded Exception!');

  const NetworkException({
    this.errorMessage = 'Something went wrong. Please try again!',
  });

  final String errorMessage;
}

extension DioErrorExtension on DioError {
  NetworkException mapToNetworkException() {
    switch (response?.statusCode) {
      case 400:
        return NetworkException.badRequest;
      case 403:
      case 401:
        return NetworkException.forbidden;
      case 408:
        return NetworkException.requestTimeout;
      case 500:
        return NetworkException.internalServerError;
      case 503:
        return NetworkException.serviceUnavailable;
      case 504:
        return NetworkException.gatewayTimeout;
      default:
        return NetworkException.unknownError;
    }
  }
}

abstract class ApiUrl {
  static const String search = '/search';
}
