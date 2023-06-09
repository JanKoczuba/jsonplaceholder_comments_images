import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entity/gallery_image.dart';

abstract class ImageGalleryRepository {
  Future<Either<Failure, List<GalleryImage>>> getImages(int page);
}
