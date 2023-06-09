import 'package:equatable/equatable.dart';

class GalleryImage extends Equatable {
  const GalleryImage({
    required this.title,
    required this.thumbnailUrl,
    required this.url,
  });

  final String title;
  final String thumbnailUrl;
  final String url;

  @override
  List<Object?> get props => [
        title,
        thumbnailUrl,
        url,
      ];
}
