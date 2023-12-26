import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jsonplaceholder_comments_images/app/constants.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/entity/comment.dart';
import 'package:jsonplaceholder_comments_images/domain/core/failure.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/api/comments_api.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/comments/repository/api_comments_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/comments/models/comments.dart';
import '../../core/fake_api.dart';

class MockCommentsApi extends Mock implements CommentsApi {}

void main() {
  late MockCommentsApi mockCommentsApi;
  late ApiCommentsRepository apiCommentsRepository;

  setUp(() {
    mockCommentsApi = MockCommentsApi();
    apiCommentsRepository = ApiCommentsRepository(mockCommentsApi);
  });

  group('ApiCommentsRepository', () {
    test('getComments returns a Failure when api call fails', () async {
      when(() => mockCommentsApi.getComments(
          page: any<int>(named: "page"),
          pageItemLimit: any<int>(named: "pageItemLimit"))).thenThrow(
        FakeApi().createError(statusCode: 404),
      );

      final result = await apiCommentsRepository.getComments(1);

      expect(result, isA<Left<Failure, List<Comment>>>());
      verify(() => mockCommentsApi.getComments(
            page: 1,
            pageItemLimit: Constants.commentsItemLimit,
          )).called(1);
      verifyNoMoreInteractions(mockCommentsApi);
    });
  });

  test('getComments returns a list of comments when api call is successful',
      () async {
    when(() => mockCommentsApi.getComments(
        page: any<int>(named: "page"),
        pageItemLimit: any<int>(named: "pageItemLimit"))).thenAnswer(
      (_) async => commentsResponseMocked,
    );

    final result = await apiCommentsRepository.getComments(1);

    expect(result, isA<Right<Failure, List<Comment>>>());
    result.fold(
      (failure) => fail('Expected list of comments, got failure $failure'),
      (comments) {
        expect(comments, commentsMocked);
      },
    );
    verify(() => mockCommentsApi.getComments(
          page: 1,
          pageItemLimit: Constants.commentsItemLimit,
        )).called(1);
    verifyNoMoreInteractions(mockCommentsApi);
  });
}
