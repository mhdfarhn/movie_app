import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_color.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? const TextStyle(color: AppColor.blue)
                : const TextStyle(color: AppColor.gray),
          ),
          backgroundColor: AppColor.background,
          indicatorColor: AppColor.background,
          surfaceTintColor: AppColor.background,
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(
              label: 'Home',
              icon: Icon(Icons.home_filled, color: AppColor.gray),
              selectedIcon: Icon(Icons.home_filled, color: AppColor.blue),
            ),
            NavigationDestination(
              label: 'Search',
              icon: Icon(
                Icons.search_rounded,
                color: AppColor.gray,
              ),
              selectedIcon: Icon(
                Icons.search_rounded,
                color: AppColor.blue,
              ),
            ),
            NavigationDestination(
              label: 'Watch List',
              icon: Icon(
                Icons.bookmark_outline_rounded,
                color: AppColor.gray,
              ),
              selectedIcon: Icon(
                Icons.bookmark_outline_rounded,
                color: AppColor.blue,
              ),
            ),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}
