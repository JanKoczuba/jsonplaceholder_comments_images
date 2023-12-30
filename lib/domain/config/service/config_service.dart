import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConfigService {
  Stream<InternetConnectionStatus> get onStatusChange;
  Future<bool> checkInternetConnection();
}
