import 'package:injectable/injectable.dart';

import '../service/config_service.dart';

@injectable
class CheckInternetConnectionUseCase {
  final ConfigService _configService;

  CheckInternetConnectionUseCase(this._configService);

  Future<bool> execute() => _configService.checkInternetConnection();
}
