import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/api/network_module.dart';
import 'api/image_gallery_api.dart';

@module
abstract class ImageGalleryModule {
  @LazySingleton(env: [Environment.prod])
  ImageGalleryApi provideImageGalleryApi(
    @Named(mainDioName) Dio dio,
  ) {
    return ImageGalleryApi(dio);
  }
}
