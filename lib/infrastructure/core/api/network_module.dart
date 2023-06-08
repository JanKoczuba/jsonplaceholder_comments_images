import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const mainDioName = "mainDio";

@module
abstract class NetworkModule {
  @LazySingleton()
  @Named(mainDioName)
  Dio provideMainDio(
    PrettyDioLogger logInterceptor,
  ) {
    final mainDio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
    ));
    if (kDebugMode) {
      mainDio.interceptors.add(logInterceptor);
    }

    return mainDio;
  }

  @LazySingleton()
  PrettyDioLogger provideLogInterceptor() {
    return PrettyDioLogger();
  }
}
