import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_comments_images/domain/config/use_case/check_internet_connection_status_usecase.dart';
import 'package:jsonplaceholder_comments_images/domain/config/use_case/on_internet_conection_changed_use_case.dart';
import 'package:jsonplaceholder_comments_images/presentation/config/bloc/config_cubit.dart';
import 'package:mocktail/mocktail.dart';

import 'fake_config_state.dart';

class MockOnInternetConnectionChangedUseCase extends Mock
    implements OnInternetConnectionChangedUseCase {}

class MockCheckInternetConnectionUseCase extends Mock
    implements CheckInternetConnectionUseCase {}

void main() {
  late MockOnInternetConnectionChangedUseCase
      mockOnInternetConnectionChangedUseCase;
  late MockCheckInternetConnectionUseCase mockCheckInternetConnectionUseCase;

  setUp(() {
    mockOnInternetConnectionChangedUseCase =
        MockOnInternetConnectionChangedUseCase();
    mockCheckInternetConnectionUseCase = MockCheckInternetConnectionUseCase();

    when(() => mockOnInternetConnectionChangedUseCase.execute())
        .thenAnswer((_) => const Stream<InternetConnectionStatus>.empty());
  });

  group(
    'ConfigCubit tests',
    () {
      test('initial state is ConfigState.initial()', () {
        expect(
          ConfigCubit(mockOnInternetConnectionChangedUseCase,
                  mockCheckInternetConnectionUseCase)
              .state,
          equals(ConfigState.initial()),
        );
      });
      blocTest<ConfigCubit, ConfigState>(
        'emits [] when nothing is added',
        build: () => ConfigCubit(mockOnInternetConnectionChangedUseCase,
            mockCheckInternetConnectionUseCase),
        expect: () => [],
      );
      blocTest<ConfigCubit, ConfigState>(
        'emits [disconnected] when InternetConnectionStatus.disconnected is added',
        setUp: () =>
            when(() => mockOnInternetConnectionChangedUseCase.execute())
                .thenAnswer((_) => Stream<InternetConnectionStatus>.value(
                    InternetConnectionStatus.disconnected)),
        build: () => ConfigCubit(mockOnInternetConnectionChangedUseCase,
            mockCheckInternetConnectionUseCase),
        expect: () => [FakeConfigState.tNoInternetConection],
      );

      blocTest<ConfigCubit, ConfigState>(
        'emits [disconnected, connected] when InternetConnectionStatus.InternetConnectionStatus and after InternetConnectionStatus.connected is added',
        setUp: () =>
            when(() => mockOnInternetConnectionChangedUseCase.execute())
                .thenAnswer((_) =>
                    Stream<InternetConnectionStatus>.fromIterable([
                      InternetConnectionStatus.disconnected,
                      InternetConnectionStatus.connected
                    ])),
        build: () => ConfigCubit(mockOnInternetConnectionChangedUseCase,
            mockCheckInternetConnectionUseCase),
        expect: () => [
          FakeConfigState.tNoInternetConection,
          FakeConfigState.tHasInternetConection
        ],
      );

      blocTest<ConfigCubit, ConfigState>(
        'emits [indexChanged] when changeTabIndex is called',
        build: () => ConfigCubit(mockOnInternetConnectionChangedUseCase,
            mockCheckInternetConnectionUseCase),
        act: (cubit) => cubit.changeTabIndex(1),
        expect: () => [FakeConfigState.tComments],
      );
      blocTest<ConfigCubit, ConfigState>(
        'emits [true] when checkInternetConnection is called and the internet is connected',
        setUp: () => when(() => mockCheckInternetConnectionUseCase.execute())
            .thenAnswer((_) async => true),
        build: () => ConfigCubit(mockOnInternetConnectionChangedUseCase,
            mockCheckInternetConnectionUseCase),
        act: (cubit) => cubit.checkInternetConnection(),
        expect: () => [FakeConfigState.tHasInternetConection],
      );

      blocTest<ConfigCubit, ConfigState>(
        'emits [false] when checkInternetConnection is called and the internet is disconnected',
        setUp: () => when(() => mockCheckInternetConnectionUseCase.execute())
            .thenAnswer((_) async => false),
        build: () => ConfigCubit(mockOnInternetConnectionChangedUseCase,
            mockCheckInternetConnectionUseCase),
        act: (cubit) => cubit.checkInternetConnection(),
        expect: () => [FakeConfigState.tNoInternetConection],
      );

      blocTest<ConfigCubit, ConfigState>(
        'cubit is closed when close is called',
        build: () => ConfigCubit(mockOnInternetConnectionChangedUseCase,
            mockCheckInternetConnectionUseCase),
        act: (cubit) async {
          await cubit.close();
        },
        wait: const Duration(milliseconds: 300),
        expect: () => [],
        verify: (cubit) => cubit.isClosed,
      );
    },
  );
}
