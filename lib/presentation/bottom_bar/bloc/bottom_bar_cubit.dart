import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bottom_bar_state.dart';

part 'bottom_bar_cubit.freezed.dart';

@injectable
class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarState.initial());

  void changeTabIndex(int index) =>
      emit(state.copyWith(currentTabIndex: index));
}
