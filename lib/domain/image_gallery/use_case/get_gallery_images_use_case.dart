import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../entity/gallery_image.dart';
import '../repository/image_gallery_repository.dart';

@injectable
class GetGalleryImagesUseCase {
  final ImageGalleryRepository _imageGalleryRepository;

  GetGalleryImagesUseCase(
    this._imageGalleryRepository,
  );

  Future<Either<Failure, List<GalleryImage>>> execute(int page) =>
      _imageGalleryRepository.getImages(page);
}
