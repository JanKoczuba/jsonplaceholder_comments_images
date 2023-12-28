import 'package:auto_route/auto_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jsonplaceholder_comments_images/router/app_router.dart';
import 'package:jsonplaceholder_comments_images/router/app_router.gr.dart';

void main() {
  late AppRouter appRouter;

  setUp(() {
    appRouter = AppRouter();
  });

  group(
    'AppRouter',
    () {
      test('defaultRouteType returns RouteType.adaptive', () {
        expect(appRouter.defaultRouteType, const RouteType.adaptive());
      });

      test('routes list is set up correctly', () {
        expect(appRouter.routes.length, 2);

        final homeRoute = appRouter.routes[0];
        expect(homeRoute.name, HomeRoute.name);
        expect(homeRoute.initial, true);
        expect(homeRoute.children?.routes.length, 2);
        expect(homeRoute.children?.routes.toList()[0].name, CommentsRoute.name);
        expect(homeRoute.children?.routes.toList()[1].name,
            ImageGalleryRoute.name);

        final noInternetConnectionRoute = appRouter.routes[1];
        expect(noInternetConnectionRoute.name, NoInternetConnectionRoute.name);
        final noInternetConnectionRouteType =
            noInternetConnectionRoute.type as CustomRouteType;
        expect(
            noInternetConnectionRouteType.transitionsBuilder ==
                TransitionsBuilders.noTransition,
            true);
      });
    },
  );
}
