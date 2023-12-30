import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/home_page.dart';

import 'home_robot.dart';

void main() {
  testWidgets('should show home page contents', (tester) async {
    final robot = HomePageRobot(tester);
    await robot.pumpHomePageContents();
    expect(find.byType(HomePage), findsOneWidget);
  });
}
