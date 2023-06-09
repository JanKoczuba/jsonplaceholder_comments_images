import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/model/get_comments_response.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const GetCommentsResponse tGetCommentsResponse = GetCommentsResponse(
    id: 1,
    postId: 1,
    name: "comment name",
    email: "comment@email.com",
    body: "comment body",
  );

  test(
    'should return a valid get comment response model',
        () async {
      final Map<String, dynamic> json =
      jsonDecode(fixture('comments/comment.json')) as Map<String, dynamic>;
      final result = GetCommentsResponse.fromJson(json);

      expect(result, tGetCommentsResponse);
    },
  );
}
