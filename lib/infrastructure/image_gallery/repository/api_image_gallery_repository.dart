import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../app/constants.dart';
import '../../../domain/core/failure.dart';
import '../../../domain/image_gallery/entity/gallery_image.dart';
import '../../../domain/image_gallery/repository/image_gallery_repository.dart';
import '../../core/services/base_api_service.dart';
import '../api/image_gallery_api.dart';

@Injectable(as: ImageGalleryRepository)
class ApiImageGalleryRepository extends BaseApiService
    implements ImageGalleryRepository {
  final ImageGalleryApi _api;

  ApiImageGalleryRepository(
    this._api,
  );

  @override
  Future<Either<Failure, List<GalleryImage>>> getImages(int page) =>
      makeRequest(
        () async {
          final photosResponse = await _api.getPhotos(
            page: page,
            pageItemLimit: Constants.imageGalleryItemLimit,
          );
          return right(
            photosResponse
                .map(
                  (photo) => GalleryImage(
                    title: photo.title,
                    thumbnailUrl: photo.thumbnailUrl,
                    url: photo.url,
                  ),
                )
                .toList(),
          );
        },
      );
}
