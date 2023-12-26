import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/bloc/config_cubit.dart';
import 'widget/bottom_nav_icon_builder.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BottomNavIconBuilder(
      builder: (context, bottomNavIcons, currentTabIndex) {
        return AutoTabsScaffold(
          routes: bottomNavIcons.map((icon) => icon.route).toList(),
          bottomNavigationBuilder:
              (BuildContext context, TabsRouter tabsRouter) =>
                  BlocListener<ConfigCubit, ConfigState>(
            listenWhen: (previous, current) =>
                previous.currentTabIndex != current.currentTabIndex,
            listener: (context, state) =>
                tabsRouter.setActiveIndex(state.currentTabIndex),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: (index) =>
                  context.read<ConfigCubit>().changeTabIndex(index),
              items: bottomNavIcons
                  .map((bottomNavIcon) => BottomNavigationBarItem(
                        label: bottomNavIcon.label,
                        icon: Container(
                          key: bottomNavIcon.key,
                          height: 24,
                          width: 24,
                          margin: const EdgeInsets.only(bottom: 4),
                          child: bottomNavIcon.icon,
                        ),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
