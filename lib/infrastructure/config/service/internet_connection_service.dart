import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../domain/config/service/config_service.dart';

@LazySingleton(as: ConfigService)
class InternetConnectionService implements ConfigService {
  final _internetConnectionChecker = InternetConnectionChecker();

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      _internetConnectionChecker.onStatusChange;

  @override
  Future<bool> checkInternetConnection() async {
    return await _internetConnectionChecker.hasConnection;
  }
}
