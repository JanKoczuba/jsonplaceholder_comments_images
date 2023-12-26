import 'package:injectable/injectable.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/api/image_gallery_api.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/model/get_image_response.dart';

import '../../../fixtures/image_gallery/models/image_gallery.dart';
import '../../core/fake_api.dart';

@LazySingleton(as: ImageGalleryApi, env: [Environment.test])
class FakeImageGalleryApi extends FakeApi implements ImageGalleryApi {
  @override
  Future<List<GetImageResponse>> getPhotos({
    required int page,
    required int pageItemLimit,
  }) async =>
      fakeRequest(
        () async => imagesResponseMocked,
      );
}
