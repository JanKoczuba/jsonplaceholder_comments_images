import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_comments_response.g.dart';

@JsonSerializable(createToJson: false)
class GetCommentsResponse extends Equatable {
  const GetCommentsResponse({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseFromJson(json);

  @override
  List<Object?> get props => [
        id,
        postId,
        name,
        email,
        body,
      ];
}
