import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../entity/comment.dart';
import '../repository/comments_repository.dart';

@injectable
class GetCommentsUseCase {
  final CommentsRepository _commentsRepository;

  GetCommentsUseCase(
    this._commentsRepository,
  );

  Future<Either<Failure, List<Comment>>> execute(int page) =>
      _commentsRepository.getComments(page);
}
