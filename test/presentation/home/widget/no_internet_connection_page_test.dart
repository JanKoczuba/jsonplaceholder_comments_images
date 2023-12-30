import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/main.dart';
import 'package:jsonplaceholder_comments_images/presentation/home/widget/no_internet_connection_page.dart';

import '../../../di/di.dart';
import '../../../infrastructure/core/fake_api.dart';

void main() {
  testWidgets('should show home page contents', (tester) async {
    FakeApi.setHasInternetConnection(false);

    await getIt.reset();
    await configureDependencies();
    await tester.pumpWidget(
      MyApp(),
    );

    await tester.pump();

    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(NoInternetConnectionPage), findsOneWidget);
  });
}
