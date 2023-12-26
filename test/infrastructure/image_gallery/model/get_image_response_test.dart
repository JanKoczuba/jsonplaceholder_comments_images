import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/model/get_image_response.dart';

import '../../../fixtures/image_gallery/models/image_gallery.dart';

void main() {
  test('GetImageResponse.fromJson creates correct object', () {
    final json = imagesJsonMocked;

    final response = GetImageResponse.fromJson(json);

    expect(response.id, json['id']);
    expect(response.albumId, json['albumId']);
    expect(response.title, json['title']);
    expect(response.thumbnailUrl, json['thumbnailUrl']);
    expect(response.url, json['url']);
    expect(response.props, [
      json['id'],
      json['albumId'],
      json['title'],
      json['thumbnailUrl'],
      json['url'],
    ]);
  });
}
