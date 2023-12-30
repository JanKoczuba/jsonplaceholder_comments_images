import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../router/app_router.gr.dart';
import '../../../utils/context_extension.dart';
import '../../config/bloc/config_cubit.dart';

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
    super.key,
    required this.builder,
  });

  final IconBottomBarWidgetBuilder builder;

  static const keyImageGalleryTabButton = Key("ImageGalleryTabButton");
  static const keyCommentsTabButton = Key("CommentsTabButton");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigCubit, ConfigState>(
      builder: (context, state) {
        final bottomNavIcon = [
          BottomNavBarIcon(
            key: keyImageGalleryTabButton,
            icon: const Icon(Icons.image),
            label: context.localizations.bottomNavBarGallery,
            route: const ImageGalleryRoute(),
          ),
          BottomNavBarIcon(
            key: keyCommentsTabButton,
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
