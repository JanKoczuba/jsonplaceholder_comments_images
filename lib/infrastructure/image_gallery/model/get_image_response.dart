import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_image_response.g.dart';

@JsonSerializable()
class GetImageResponse extends Equatable {
  const GetImageResponse({
    required this.id,
    required this.albumId,
    required this.title,
    required this.thumbnailUrl,
    required this.url,
  });

  final int id;
  final int albumId;
  final String title;
  final String thumbnailUrl;
  final String url;

  factory GetImageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImageResponseFromJson(json);

  @override
  List<Object?> get props => [
        id,
        albumId,
        title,
        thumbnailUrl,
        url,
      ];
}
