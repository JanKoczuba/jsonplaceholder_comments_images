import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/main.dart';

import '../../../di/di.dart';
import '../../../infrastructure/core/fake_api.dart';

class InternetConnectionRobot {
  InternetConnectionRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpNoInternetConnectionPage() async {
    FakeApi.setHasInternetConnection(false);

    await getIt.reset();
    await configureDependencies();
    await tester.pumpWidget(
      MyApp(),
    );

    await tester.pump();

    await tester.pump(const Duration(seconds: 2));
  }
}
