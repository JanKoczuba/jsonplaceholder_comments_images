import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/comments/comments_page.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/home_page.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/image_gallery/image_gallery_page.dart';

import 'home_robot.dart';

void main() {
  group(
    'home page bottom bar naviagation tests',
    () {
      testWidgets('should show home page contents', (tester) async {
        final robot = HomePageRobot(tester);
        await robot.pumpHomePageContents();
        expect(find.byType(HomePage), findsOneWidget);
        expect(find.byType(ImageGalleryPage), findsOneWidget);
      });

      testWidgets(
        'should show comments page',
        (tester) async {
          final robot = HomePageRobot(tester);
          await robot.pumpHomePageContents();
          await robot.tapCommentsBottomMenuTab();
          expect(find.byType(CommentsPage), findsOneWidget);
        },
      );
      testWidgets(
        'should show image gallery page',
        (tester) async {
          final robot = HomePageRobot(tester);
          await robot.pumpHomePageContents();
          await robot.tapImageGalleryBottomMenuTab();
          expect(find.byType(ImageGalleryPage), findsOneWidget);
        },
      );

      testWidgets(
        'should show changed page on tap',
        (tester) async {
          final robot = HomePageRobot(tester);
          await robot.pumpHomePageContents();
          await robot.tapImageGalleryBottomMenuTab();
          expect(find.byType(ImageGalleryPage), findsOneWidget);
          await robot.tapCommentsBottomMenuTab();
          expect(find.byType(CommentsPage), findsOneWidget);
        },
      );
    },
  );
}
