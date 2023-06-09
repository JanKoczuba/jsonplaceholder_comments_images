part of 'config_cubit.dart';

@freezed
class ConfigState with _$ConfigState {
  factory ConfigState({
    required int currentTabIndex,
    required bool hasInternetConnection,
  }) = _ConfigState;

  static ConfigState initial() => ConfigState(
        currentTabIndex: 0,
        hasInternetConnection: true,
      );
}
