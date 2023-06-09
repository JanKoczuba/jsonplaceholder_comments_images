import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/model/get_image_response.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const GetImageResponse tGetImageResponse = GetImageResponse(
    id: 1,
    albumId: 1,
    title: "image name",
    thumbnailUrl: "thumbnail url",
    url: "image url",
  );

  test(
    'should return a valid get image response model',
    () async {
      final Map<String, dynamic> json =
          jsonDecode(fixture('image_gallery/image.json'))
              as Map<String, dynamic>;
      final result = GetImageResponse.fromJson(json);

      expect(result, tGetImageResponse);
    },
  );
}
