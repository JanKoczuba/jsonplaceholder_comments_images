import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/model/get_comments_response.dart';

import '../../../fixtures/comments/models/comments.dart';

void main() {
  test('GetCommentsResponse.fromJson creates correct object', () {
    final json = commentJsonMocked;

    final response = GetCommentsResponse.fromJson(json);

    expect(response.id, json['id']);
    expect(response.postId, json['postId']);
    expect(response.name, json['name']);
    expect(response.email, json['email']);
    expect(response.body, json['body']);
    expect(response.props, [
      json['id'],
      json['postId'],
      json['name'],
      json['email'],
      json['body'],
    ]);
  });
}
