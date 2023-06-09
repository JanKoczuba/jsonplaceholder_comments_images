import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/entity/comment.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/repository/comments_repository.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/use_case/get_comments_use_case.dart';
import 'package:jsonplaceholder_comments_images/domain/core/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([CommentsRepository])
import 'get_comments_use_case_test.mocks.dart';

void main() {
  late GetCommentsUseCase useCase;
  late CommentsRepository repository;

  setUp(() async {
    repository = MockCommentsRepository();
    useCase = GetCommentsUseCase(repository);
  });

  final List<Comment> tComments = [
    const Comment(
      name: "comment name",
      email: "comment@email.com",
      body: "comment body",
    ),
    const Comment(
      name: "comment name",
      email: "comment@email.com",
      body: "comment body",
    ),
  ];
  const page = 1;

  test(
    'should get comments from the repository',
        () async {
      when(repository.getComments(page))
          .thenAnswer((_) async => right(tComments));
      final result = await useCase.execute(page);
      expect(result, right(tComments));
      verify(repository.getComments(page));
      verifyNoMoreInteractions(repository);
    },
  );
  test(
    'should return failure from the repository on fail',
        () async {
      when(repository.getComments(page))
          .thenAnswer((_) async => left(const Failure.unknown()));
      final result = await useCase.execute(page);
      expect(result, left(const Failure.unknown()));
      verify(repository.getComments(page));
      verifyNoMoreInteractions(repository);
    },
  );
}
