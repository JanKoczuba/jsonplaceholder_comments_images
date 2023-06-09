import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../resource/app_padding.dart';
import 'widget/image_gallery.dart';

@RoutePage()
class ImageGalleryPage extends StatefulWidget {
  const ImageGalleryPage({Key? key}) : super(key: key);

  @override
  State<ImageGalleryPage> createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.page,
          child: ImageGallery(),
        ),
      ),
    );
  }
}
