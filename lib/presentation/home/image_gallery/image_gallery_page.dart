import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('ImageGalleryPage'),
      ),
    );
  }
}
