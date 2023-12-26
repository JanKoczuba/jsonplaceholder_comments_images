import 'dart:convert';

import 'package:jsonplaceholder_comments_images/domain/image_gallery/entity/gallery_image.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/model/get_image_response.dart';

import '../../fixture_reader.dart';

Map<String, dynamic> get imagesJsonMocked =>
    jsonDecode(fixture('image_gallery/image.json'));

const imagesResponseMocked = [
  GetImageResponse(
    id: 1,
    albumId: 1,
    title: "title",
    thumbnailUrl: "assets/test/150x150.png",
    url: "assets/test/600x600.png",
  ),
  GetImageResponse(
    id: 2,
    albumId: 2,
    title: "title",
    thumbnailUrl: "assets/test/150x150.png",
    url: "assets/test/600x600.png",
  ),
  GetImageResponse(
    id: 3,
    albumId: 3,
    title: "title",
    thumbnailUrl: "assets/test/150x150.png",
    url: "assets/test/600x600.png",
  ),
];

const imageGalleryMocked = [
  GalleryImage(
    title: "title",
    thumbnailUrl: "assets/test/150x150.png",
    url: "assets/test/600x600.png",
  ),
  GalleryImage(
    title: "title",
    thumbnailUrl: "assets/test/150x150.png",
    url: "assets/test/600x600.png",
  ),
  GalleryImage(
    title: "title",
    thumbnailUrl: "assets/test/150x150.png",
    url: "assets/test/600x600.png",
  ),
];
