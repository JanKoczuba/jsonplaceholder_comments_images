part of 'bottom_bar_cubit.dart';

@freezed
class BottomBarState with _$BottomBarState {
  factory BottomBarState({
    required int currentTabIndex,
  }) = _BottomBarState;

  static BottomBarState initial() => BottomBarState(
        currentTabIndex: 0,
      );
}
