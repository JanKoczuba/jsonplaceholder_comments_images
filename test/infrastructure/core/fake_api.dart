import 'dart:async';

import 'package:dio/dio.dart';

import '../../di/di.dart';

typedef ResponseFunction<T> = FutureOr<T> Function();

F getFake<T extends Object, F extends T>() => getIt<T>() as F;

class FakeApi {
  static const delay = Duration(seconds: 1);
  static bool hasInternetConnection = true;

  static void setHasInternetConnection(bool hasInternetConnection) {
    FakeApi.hasInternetConnection = hasInternetConnection;
  }

  Exception createBadRequestError({
    String? errorMessage,
  }) =>
      createError(
        statusCode: 400,
        errorMessage: errorMessage,
      );

  Exception createNotFoundError({
    String? errorMessage,
  }) =>
      createError(
        statusCode: 404,
        errorMessage: errorMessage,
      );

  Exception createError({
    required int statusCode,
    String? errorMessage,
  }) {
    return DioException(
      requestOptions: RequestOptions(
        path: '',
      ),
      type: DioExceptionType.badResponse,
      response: Response(
        statusCode: statusCode,
        requestOptions: RequestOptions(
          path: '',
        ),
        data: {
          "blad": errorMessage,
          "service": runtimeType.toString(),
        },
      ),
    );
  }

  Future<T> fakeRequest<T>(ResponseFunction<T> function) async {
    await Future.delayed(delay);

    if (!hasInternetConnection) {
      throw _createTimeoutError();
    }

    return function();
  }

  DioException _createTimeoutError() {
    return DioException(
      requestOptions: RequestOptions(
        path: '',
      ),
      type: DioExceptionType.connectionTimeout,
      response: null,
    );
  }
}
