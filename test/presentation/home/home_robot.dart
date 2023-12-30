import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/main.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/widget/bottom_nav_icon_builder.dart';

import '../../di/di.dart';
import '../../infrastructure/core/fake_api.dart';

class HomePageRobot {
  HomePageRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpHomePageContents() async {
    FakeApi.setHasInternetConnection(true);
    await getIt.reset();
    await configureDependencies();
    await tester.pumpWidget(
      MyApp(),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapImageGalleryBottomMenuTab() async {
    final finder = find.byKey(BottomNavIconBuilder.keyImageGalleryTabButton);

    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapCommentsBottomMenuTab() async {
    final finder = find.byKey(BottomNavIconBuilder.keyCommentsTabButton);

    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
