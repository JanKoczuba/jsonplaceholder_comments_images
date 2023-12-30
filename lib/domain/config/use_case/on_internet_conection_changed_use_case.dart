import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../service/config_service.dart';

@injectable
class OnInternetConnectionChanged {
  final ConfigService _configService;

  OnInternetConnectionChanged(this._configService);

  Stream<InternetConnectionStatus> execute() => _configService.onStatusChange;
}
