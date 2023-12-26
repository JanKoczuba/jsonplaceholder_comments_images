import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jsonplaceholder_comments_images/domain/core/failure.dart';
import 'package:jsonplaceholder_comments_images/domain/image_gallery/entity/gallery_image.dart';
import 'package:jsonplaceholder_comments_images/domain/image_gallery/repository/image_gallery_repository.dart';
import 'package:jsonplaceholder_comments_images/domain/image_gallery/use_case/get_gallery_images_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/image_gallery/models/image_gallery.dart';

class MockImageGalleryRepository extends Mock
    implements ImageGalleryRepository {}

void main() {
  late MockImageGalleryRepository mockImageGalleryRepository;
  late GetGalleryImagesUseCase getGalleryImagesUseCase;

  setUp(() {
    mockImageGalleryRepository = MockImageGalleryRepository();
    getGalleryImagesUseCase =
        GetGalleryImagesUseCase(mockImageGalleryRepository);
  });

  group(
    'GetGalleryImagesUseCase',
    () {
      test(
          'execute returns a list of gallery images when repository call is successful',
          () async {
        when(() => mockImageGalleryRepository.getImages(any())).thenAnswer(
          (_) async => right(imageGalleryMocked),
        );

        final result = await getGalleryImagesUseCase.execute(1);

        expect(result.isRight(), true);
        result.fold(
          (failure) =>
              fail('Expected list of gallery images, got failure $failure'),
          (images) {
            expect(images, isA<List<GalleryImage>>());
            expect(images, imageGalleryMocked);
          },
        );
      });

      test('execute returns a failure when repository call is unsuccessful',
          () async {
        when(() => mockImageGalleryRepository.getImages(any())).thenAnswer(
          (_) async => left(const Failure.badRequest()),
        );

        final result = await getGalleryImagesUseCase.execute(1);

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<Failure>()),
          (_) => fail('Expected failure, got list of gallery images'),
        );
      });
    },
  );
}
