import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../router/app_router.gr.dart';
import '../../../../utils/context_extension.dart';
import '../../bloc/bottom_bar_cubit.dart';

class BottomNavBarIcon {
  final Key? key;
  final Icon icon;
  final String label;
  final PageRouteInfo route;

  BottomNavBarIcon({
    this.key,
    required this.icon,
    required this.label,
    required this.route,
  });
}

typedef IconBottomBarWidgetBuilder = Widget Function(BuildContext context,
    List<BottomNavBarIcon> iconConfigs, int currentTabIndex);

class BottomNavIconBuilder extends StatelessWidget {
  const BottomNavIconBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final IconBottomBarWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        final bottomNavIcon = [
          BottomNavBarIcon(
            key: const ValueKey("ImageGalleryTabButton"),
            icon: const Icon(Icons.image),
            label: context.localizations.bottomNavBarGallery,
            route: const ImageGalleryRoute(),
          ),
          BottomNavBarIcon(
            key: const ValueKey("CommentsTabButton"),
            icon: const Icon(Icons.comment),
            label: context.localizations.bottomNavBarComments,
            route: const CommentsRoute(),
          ),
        ];
        return builder(context, bottomNavIcon, state.currentTabIndex);
      },
    );
  }
}
