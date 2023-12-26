import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/domain/core/failure.dart';
import 'package:jsonplaceholder_comments_images/domain/image_gallery/entity/gallery_image.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/api/image_gallery_api.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/repository/api_image_gallery_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/image_gallery/models/image_gallery.dart';
import '../../core/fake_api.dart'; // replace with the actual path to your class

class MockImageGalleryApi extends Mock implements ImageGalleryApi {}

void main() {
  late MockImageGalleryApi mockImageGalleryApi;
  late ApiImageGalleryRepository apiImageGalleryRepository;

  setUp(() {
    mockImageGalleryApi = MockImageGalleryApi();
    apiImageGalleryRepository = ApiImageGalleryRepository(mockImageGalleryApi);
  });

  group('ApiImageGalleryRepository', () {
    test('getImages returns a list of images when api call is successful',
        () async {
      when(() => mockImageGalleryApi.getPhotos(
            page: any(named: 'page'),
            pageItemLimit: any(named: 'pageItemLimit'),
          )).thenAnswer(
        (_) async => imagesResponseMocked,
      );

      final result = await apiImageGalleryRepository.getImages(1);

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected list of images, got failure $failure'),
        (images) {
          expect(images, isA<List<GalleryImage>>());
          expect(images.length, imagesResponseMocked.length);
        },
      );
    });

    test('getImages returns a failure when api call is unsuccessful', () async {
      when(() => mockImageGalleryApi.getPhotos(
            page: any(named: 'page'),
            pageItemLimit: any(named: 'pageItemLimit'),
          )).thenThrow(
        FakeApi().createError(statusCode: 404),
      );

      final result = await apiImageGalleryRepository.getImages(1);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<Failure>()),
        (_) => fail('Expected failure, got list of images'),
      );
    });
  });
}
