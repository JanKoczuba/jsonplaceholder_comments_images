import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@injectable
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true, children: [
      AutoRoute(page: CommentsRoute.page),
      AutoRoute(page: ImageGalleryRoute.page),
    ]),
    CustomRoute(
      page: NoInternetConnectionRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];
}
