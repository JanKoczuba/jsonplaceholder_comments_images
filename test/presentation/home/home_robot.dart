import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/main.dart';

import '../../di/di.dart';
import '../../infrastructure/core/fake_api.dart';

class HomePageRobot {
  HomePageRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpHomePageContents() async {
    FakeApi.setHasInternetConnection(true);
    //  await getIt.reset();
    await configureDependencies();
    await tester.pumpWidget(
      MyApp(),
    );
    await tester.pumpAndSettle();
  }
}
