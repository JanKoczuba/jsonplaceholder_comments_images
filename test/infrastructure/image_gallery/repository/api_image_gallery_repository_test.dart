import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/api/image_gallery_api.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/model/get_image_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/json_decode.dart';
@GenerateMocks([ImageGalleryApi])
import 'api_image_gallery_repository_test.mocks.dart';

void main() {
  final List<GetImageResponse> tImages = [
    const GetImageResponse(
      id: 1,
      albumId: 1,
      title: "image name",
      thumbnailUrl: "thumbnail url",
      url: "image url",
    ),
    const GetImageResponse(
      id: 1,
      albumId: 2,
      title: "image name",
      thumbnailUrl: "thumbnail url",
      url: "image url",
    ),
  ];

  late ImageGalleryApi imageGalleryApi;

  setUp(() async {
    imageGalleryApi = MockImageGalleryApi();
  });

  test(
    'Should return images data',
    () async {
      final List list =
          jsonDecodeFile('image_gallery/images.json') as List<dynamic>;
      final images =
          list.map((json) => GetImageResponse.fromJson(json)).toList();
      when(imageGalleryApi.getPhotos(
        page: 1,
        pageItemLimit: 2,
      )).thenAnswer((_) async => tImages);

      final result = await imageGalleryApi.getPhotos(
        page: 1,
        pageItemLimit: 2,
      );
      expect(
        result,
        equals(images),
      );
    },
  );
}
