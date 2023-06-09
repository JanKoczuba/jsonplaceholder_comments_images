import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/domain/core/failure.dart';
import 'package:jsonplaceholder_comments_images/domain/image_gallery/entity/gallery_image.dart';
import 'package:jsonplaceholder_comments_images/domain/image_gallery/repository/image_gallery_repository.dart';
import 'package:jsonplaceholder_comments_images/domain/image_gallery/use_case/get_gallery_images_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ImageGalleryRepository])
import 'get_gallery_images_use_case_test.mocks.dart';

void main() {
  late GetGalleryImagesUseCase useCase;
  late ImageGalleryRepository repository;

  setUp(() async {
    repository = MockImageGalleryRepository();
    useCase = GetGalleryImagesUseCase(repository);
  });

  final List<GalleryImage> tImages = [
    const GalleryImage(
      title: "image name",
      thumbnailUrl: "thumbnail url",
      url: "image url",
    ),
    const GalleryImage(
      title: "image name",
      thumbnailUrl: "thumbnail url",
      url: "image url",
    ),
  ];
  const page = 1;

  test(
    'should get images from the repository',
    () async {
      when(repository.getImages(page)).thenAnswer((_) async => right(tImages));
      final result = await useCase.execute(page);
      expect(result, right(tImages));
      verify(repository.getImages(page));
      verifyNoMoreInteractions(repository);
    },
  );
  test(
    'should return failure from the repository on fail',
    () async {
      when(repository.getImages(page))
          .thenAnswer((_) async => left(const Failure.unknown()));
      final result = await useCase.execute(page);
      expect(result, left(const Failure.unknown()));
      verify(repository.getImages(page));
      verifyNoMoreInteractions(repository);
    },
  );
}
