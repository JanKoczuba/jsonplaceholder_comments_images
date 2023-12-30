import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../domain/config/use_case/check_internet_connection_status_usecase.dart';
import '../../../domain/config/use_case/on_internet_conection_changed_use_case.dart';

part 'config_cubit.freezed.dart';
part 'config_state.dart';

@injectable
class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit(
    this._onInternetConnectionChanged,
    this._checkInternetConnectionUseCase,
  ) : super(ConfigState.initial()) {
    _internetConnectionSubscription =
        _onInternetConnectionChanged.execute().listen(_updateConnectionStatus);
  }

  final OnInternetConnectionChangedUseCase _onInternetConnectionChanged;
  final CheckInternetConnectionUseCase _checkInternetConnectionUseCase;
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
    final hasConnection = await _checkInternetConnectionUseCase.execute();

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
