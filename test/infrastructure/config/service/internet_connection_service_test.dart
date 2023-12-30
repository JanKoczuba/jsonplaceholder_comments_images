import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/config/service/internet_connection_service.dart';
import 'package:mocktail/mocktail.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late InternetConnectionService internetConnectionService;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    internetConnectionService = InternetConnectionService();
  });

  group('InternetConnectionService', () {
    test('onStatusChange returns a stream', () {
      when(() => mockInternetConnectionChecker.onStatusChange)
          .thenAnswer((_) => const Stream<InternetConnectionStatus>.empty());

      expect(internetConnectionService.onStatusChange,
          isA<Stream<InternetConnectionStatus>>());
    });

    test(
        'checkInternetConnection returns the same future as InternetConnectionChecker.hasConnection',
        () async {
      when(() => mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);

      expect(await internetConnectionService.checkInternetConnection(),
          equals(true));
    });
  });
}
