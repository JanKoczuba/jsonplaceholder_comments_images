import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../service/config_service.dart';

@injectable
class OnInternetConnectionChangedUseCase {
  final ConfigService _configService;

  OnInternetConnectionChangedUseCase(this._configService);

  Stream<InternetConnectionStatus> execute() => _configService.onStatusChange;
}
