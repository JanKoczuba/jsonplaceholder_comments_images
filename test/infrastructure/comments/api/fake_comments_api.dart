import 'package:injectable/injectable.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/api/comments_api.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/model/get_comments_response.dart';

import '../../../fixtures/comments/models/comments.dart';
import '../../core/fake_api.dart';

@LazySingleton(as: CommentsApi, env: [Environment.test])
class FakeComentsApi extends FakeApi implements CommentsApi {
  @override
  Future<List<GetCommentsResponse>> getComments({
    required int page,
    required int pageItemLimit,
  }) async =>
      fakeRequest(
        () async => commentsResponseMocked,
      );
}
