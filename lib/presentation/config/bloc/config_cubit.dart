import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'config_state.dart';

part 'config_cubit.freezed.dart';

@injectable
class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(ConfigState.initial()) {
    _internetConnectionSubscription = InternetConnectionChecker()
        .onStatusChange
        .listen(_updateConnectionStatus);
  }

  late StreamSubscription<InternetConnectionStatus>
      _internetConnectionSubscription;

  void _updateConnectionStatus(
      InternetConnectionStatus connectionStatus) async {
    switch (connectionStatus) {
      case InternetConnectionStatus.disconnected:
        emit(state.copyWith(
          hasInternetConnection: false,
        ));
        break;
      case InternetConnectionStatus.connected:
        emit(state.copyWith(
          hasInternetConnection: true,
        ));
        break;
    }
  }

  void checkInternetConnection() async {
    final hasConnection = await InternetConnectionChecker().hasConnection;

    emit(state.copyWith(
      hasInternetConnection: hasConnection,
    ));
  }

  void changeTabIndex(int index) =>
      emit(state.copyWith(currentTabIndex: index));

  @override
  Future<void> close() async {
    await _internetConnectionSubscription.cancel();
    return super.close();
  }
}
