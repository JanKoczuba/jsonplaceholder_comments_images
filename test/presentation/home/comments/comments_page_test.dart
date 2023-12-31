import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jsonplaceholder_comments_images/domain/comments/use_case/get_comments_use_case.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/comments/comments_page.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/comments/widget/comment_card.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/comments/widget/comments.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/comments/models/comments.dart';
import 'comments_robot.dart';

class MockGetCommentsUseCase extends Mock implements GetCommentsUseCase {}

void main() {
  group(
    'comments page widget tests',
    () {
      late MockGetCommentsUseCase mockGetCommentsUseCase;

      setUp(() {
        mockGetCommentsUseCase = MockGetCommentsUseCase();
      });

      testWidgets('should show comments page contents', (tester) async {
        final robot = CommentsPageRobot(tester);
        await robot.pumpCommentsPageContents();
        expect(find.byType(CommentsPage), findsOneWidget);
      });

      testWidgets('should create Comments widget and initialize it',
          (tester) async {
        final robot = CommentsPageRobot(tester);

        when(() => mockGetCommentsUseCase.execute(any()))
            .thenAnswer((_) async => right([]));

        await robot.pumpCommentsPageContents();

        expect(find.byType(Comments), findsOneWidget);
      });

      testWidgets(
          'should displayed CommentCard widget for each comment in comments list',
          (tester) async {
        final robot = CommentsPageRobot(tester);

        when(() => mockGetCommentsUseCase.execute(any()))
            .thenAnswer((_) async => right(commentsMocked));

        await robot.pumpCommentsPageContents();

        expect(find.byType(CommentCard), findsExactly(commentsMocked.length));
      });

      testWidgets('should find last item from  paginated list', (tester) async {
        final robot = CommentsPageRobot(tester);

        when(() => mockGetCommentsUseCase.execute(any()))
            .thenAnswer((_) async => right(commentsPaginationMocked));

        await robot.pumpCommentsPageContents();

        final scrollWidget = find.byKey(const Key('paged_list_view'));
        final widgetToFind = find.byKey(
          Key('comments_card_${commentsPaginationMocked.length - 1}'),
        );

        await tester.dragUntilVisible(
          scrollWidget,
          widgetToFind,
          const Offset(0, -500),
        );
      });
    },
  );
}
