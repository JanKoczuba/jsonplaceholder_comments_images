import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jsonplaceholder_comments_images/domain/config/service/config_service.dart';
import 'package:jsonplaceholder_comments_images/infrastructure/config/service/internet_connection_service.dart';

import '../../core/fake_api.dart';

@Injectable(as: ConfigService, env: [Environment.test])
class FakeInternetConnectionService extends FakeApi
    implements InternetConnectionService {
  @override
  Future<bool> checkInternetConnection() async {
    if (FakeApi.hasInternetConnection) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Stream<InternetConnectionStatus> get onStatusChange {
    if (FakeApi.hasInternetConnection) {
      return Stream.value(InternetConnectionStatus.connected);
    }
    return Stream.value(InternetConnectionStatus.disconnected);
  }
}
