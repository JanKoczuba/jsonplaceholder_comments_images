import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/api/network_module.dart';
import 'api/comments_api.dart';

@module
abstract class CommentModule {
  @LazySingleton(env: [Environment.prod])
  CommentsApi provideCommentsApi(
    @Named(mainDioName) Dio dio,
  ) {
    return CommentsApi(dio);
  }
}
