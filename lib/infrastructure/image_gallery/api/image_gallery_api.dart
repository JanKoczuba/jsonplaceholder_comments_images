import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/get_image_response.dart';

part 'image_gallery_api.g.dart';

@RestApi()
abstract class ImageGalleryApi {
  factory ImageGalleryApi(Dio dio) = _ImageGalleryApi;

  @GET("photos")
  Future<List<GetImageResponse>> getPhotos({
    @Query("_page") required int page,
    @Query("_limit") required int pageItemLimit,
  });
}
