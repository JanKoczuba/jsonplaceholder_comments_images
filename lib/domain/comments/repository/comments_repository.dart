import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entity/comment.dart';

abstract class CommentsRepository {
  Future<Either<Failure, List<Comment>>> getComments(int page);
}
