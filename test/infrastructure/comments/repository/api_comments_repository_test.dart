import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/api/comments_api.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/model/get_comments_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../utils/json_decode.dart';

@GenerateMocks([CommentsApi])
import 'api_comments_repository_test.mocks.dart';

void main() {
  final List<GetCommentsResponse> tComments = [
    const GetCommentsResponse(
      id: 1,
      postId: 1,
      name: "comment name",
      email: "comment@email.com",
      body: "comment body",
    ),
    const GetCommentsResponse(
      id: 1,
      postId: 2,
      name: "comment name",
      email: "comment@email.com",
      body: "comment body",
    ),
  ];

  late CommentsApi commentsApi;

  setUp(() async {
    commentsApi = MockCommentsApi();
  });

  test(
    'Should return comments data',
    () async {
      final List list =
          jsonDecodeFile('comments/comments.json') as List<dynamic>;
      final comments =
          list.map((json) => GetCommentsResponse.fromJson(json)).toList();
      when(commentsApi.getComments(page: 1, pageItemLimit: 2))
          .thenAnswer((_) async => tComments);

      final result = await commentsApi.getComments(page: 1, pageItemLimit: 2);
      expect(
        result,
        equals(comments),
      );
    },
  );
}
