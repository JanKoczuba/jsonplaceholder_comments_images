import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_comments_images/domain/config/service/config_service.dart';
import 'package:jsonplaceholder_comments_images/domain/config/use_case/on_internet_conection_changed_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockConfigService extends Mock implements ConfigService {}

void main() {
  late MockConfigService mockConfigService;
  late OnInternetConnectionChangedUseCase onInternetConnectionChanged;

  setUp(() {
    mockConfigService = MockConfigService();
    onInternetConnectionChanged =
        OnInternetConnectionChangedUseCase(mockConfigService);
  });

  group('OnInternetConnectionChanged', () {
    test('execute returns the same stream as ConfigService.onStatusChange', () {
      const stream = Stream<InternetConnectionStatus>.empty();
      when(() => mockConfigService.onStatusChange).thenAnswer((_) => stream);

      expect(onInternetConnectionChanged.execute(), equals(stream));
    });
  });
}
