import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  const Comment({
    required this.name,
    required this.email,
    required this.body,
  });

  final String name;
  final String email;
  final String body;

  @override
  List<Object?> get props => [
        name,
        email,
        body,
      ];
}
