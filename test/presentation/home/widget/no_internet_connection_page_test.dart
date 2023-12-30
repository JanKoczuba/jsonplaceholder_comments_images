import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/widget/no_internet_connection_page.dart';

import 'internet_connection_robot.dart';

void main() {
  testWidgets('should show no internet conection page', (tester) async {
    final r = InternetConnectionRobot(tester);
    await r.pumpNoInternetConnectionPage();
    expect(find.byType(NoInternetConnectionPage), findsOneWidget);
  });
}
