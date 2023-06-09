import 'package:auto_route/auto_route.dart';

import '../presentation/home/comments/comments_page.dart';
import '../presentation/home/home_page.dart';
import '../presentation/home/image_gallery/image_gallery_page.dart';
import '../presentation/home/widget/no_internet_connection_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: ImageGalleryPage),
        AutoRoute(page: CommentsPage),
      ],
    ),
    AutoRoute(page: NoInternetConnectionPage),
  ],
)
class $AppRouter {}
