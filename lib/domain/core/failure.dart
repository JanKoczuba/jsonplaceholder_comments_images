import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverConnectionFailure() = ServerConnectionFailure;

  const factory Failure.invalidResponse() = InvalidResponseFailure;

  const factory Failure.badRequest({String? message}) = BadRequestFailure;

  const factory Failure.serverError() = ServerErrorFailure;

  const factory Failure.unknown() = UnknownErrorFailure;

  const factory Failure.notFound() = NotFoundErrorFailure;
}
