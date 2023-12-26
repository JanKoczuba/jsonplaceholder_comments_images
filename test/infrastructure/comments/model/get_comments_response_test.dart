import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/model/get_comments_response.dart';

import '../../../fixtures/comments/models/comments.dart';

void main() {
  test('GetCommentsResponse.fromJson creates correct object', () {
    final json = commentJsonMocked;

    final response = GetCommentsResponse.fromJson(json);

    expect(response.id, commentJsonMocked['id']);
    expect(response.postId, commentJsonMocked['postId']);
    expect(response.name, commentJsonMocked['name']);
    expect(response.email, commentJsonMocked['email']);
    expect(response.body, commentJsonMocked['body']);
  });
}
