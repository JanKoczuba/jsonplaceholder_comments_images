import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/domain/config/service/config_service.dart';
import 'package:jsonplaceholder_comments_images/domain/config/use_case/check_internet_connection_status_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockConfigService extends Mock implements ConfigService {}

void main() {
  late MockConfigService mockConfigService;
  late CheckInternetConnectionUseCase checkInternetConnectionUseCase;

  setUp(() {
    mockConfigService = MockConfigService();
    checkInternetConnectionUseCase =
        CheckInternetConnectionUseCase(mockConfigService);
  });

  group('CheckInternetConnectionUseCase', () {
    test(
        'execute returns the same future as ConfigService.checkInternetConnection',
        () async {
      when(() => mockConfigService.checkInternetConnection())
          .thenAnswer((_) async => true);

      expect(await checkInternetConnectionUseCase.execute(), equals(true));
    });
  });
}
