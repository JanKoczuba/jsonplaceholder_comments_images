import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    required this.imageUrl,
    this.loadingWidget,
    super.key,
  });

  final String imageUrl;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => loadingWidget ?? const SizedBox(),
    );
  }
}
