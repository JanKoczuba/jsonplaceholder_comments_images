import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/get_comments_response.dart';

part 'comments_api.g.dart';

@RestApi()
abstract class CommentsApi {
  factory CommentsApi(Dio dio) = _CommentsApi;

  @GET("comments")
  Future<List<GetCommentsResponse>> getComments({
    @Query("_page") required int page,
    @Query("_limit") required int pageItemLimit,
  });
}
