import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../app/constants.dart';
import '../../../domain/comments/entity/comment.dart';
import '../../../domain/comments/repository/comments_repository.dart';
import '../../../domain/core/failure.dart';
import '../../core/services/base_api_service.dart';
import '../api/comments_api.dart';

@Injectable(as: CommentsRepository)
class ApiCommentsRepository extends BaseApiService
    implements CommentsRepository {
  final CommentsApi _api;

  ApiCommentsRepository(
    this._api,
  );

  @override
  Future<Either<Failure, List<Comment>>> getComments(int page) => makeRequest(
        () async {
          final commentsResponse = await _api.getComments(
            page: page,
            pageItemLimit: Constants.commentsItemLimit,
          );
          return right(
            commentsResponse
                .map(
                  (comment) => Comment(
                    name: comment.name,
                    email: comment.email,
                    body: comment.body,
                  ),
                )
                .toList(),
          );
        },
      );
}
