import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/model/get_image_response.dart';

import '../../../fixtures/image_gallery/models/image_gallery.dart';

void main() {
  test('GetImageResponse.fromJson creates correct object', () {
    final json = imagesJsonMocked;

    final response = GetImageResponse.fromJson(json);

    expect(response.id, imagesJsonMocked['id']);
    expect(response.albumId, imagesJsonMocked['albumId']);
    expect(response.title, imagesJsonMocked['title']);
    expect(response.thumbnailUrl, imagesJsonMocked['thumbnailUrl']);
    expect(response.url, imagesJsonMocked['url']);
  });
}
