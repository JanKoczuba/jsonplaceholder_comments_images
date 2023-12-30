import 'package:jsonplaceholder_comments_images/presentation/config/bloc/config_cubit.dart';

class FakeConfigState {
  static ConfigState tInitial = ConfigState(
    currentTabIndex: 0,
    hasInternetConnection: true,
  );
  static ConfigState tImageGallery = ConfigState(
    currentTabIndex: 0,
    hasInternetConnection: true,
  );
  static ConfigState tComments = ConfigState(
    currentTabIndex: 1,
    hasInternetConnection: true,
  );

  static ConfigState tNoInternetConection = ConfigState(
    currentTabIndex: 0,
    hasInternetConnection: false,
  );
  static ConfigState tHasInternetConection = ConfigState(
    currentTabIndex: 0,
    hasInternetConnection: true,
  );
}
