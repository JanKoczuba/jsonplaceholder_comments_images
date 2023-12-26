import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/entity/comment.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/repository/comments_repository.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/use_case/get_comments_use_case.dart';
import 'package:jsonplaceholder_comments_images/domain/core/failure.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/comments/models/comments.dart';

class MockCommentsRepository extends Mock implements CommentsRepository {}

void main() {
  late MockCommentsRepository mockCommentsRepository;
  late GetCommentsUseCase getCommentsUseCase;

  setUp(() {
    mockCommentsRepository = MockCommentsRepository();
    getCommentsUseCase = GetCommentsUseCase(mockCommentsRepository);
  });

  group(
    'GetCommentsUseCase',
    () {
      test(
          'execute returns a list of comments when repository call is successful',
          () async {
        when(() => mockCommentsRepository.getComments(any())).thenAnswer(
          (_) async => right(commentsMocked),
        );

        final result = await getCommentsUseCase.execute(1);

        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected list of comments, got failure $failure'),
          (comments) {
            expect(comments, isA<List<Comment>>());
            expect(comments, commentsMocked);
          },
        );
      });

      test('execute returns a failure when repository call is unsuccessful',
          () async {
        when(() => mockCommentsRepository.getComments(any())).thenAnswer(
          (_) async => left(const Failure.badRequest()),
        );

        final result = await getCommentsUseCase.execute(1);

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<Failure>()),
          (_) => fail('Expected failure, got list of comments'),
        );
      });
    },
  );
}
