import 'package:flutter/material.dart';

import '../app_color.dart';
import '../app_text_style.dart';

class TabBarWidget extends StatelessWidget {
  final List<Tab> tabs;
  final TabController tabController;

  const TabBarWidget({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      dividerColor: AppColor.background,
      indicatorColor: AppColor.darkGray,
      isScrollable: true,
      labelColor: AppColor.white,
      unselectedLabelColor: AppColor.white,
      labelStyle: AppTextStyle.button,
      unselectedLabelStyle: AppTextStyle.button,
      splashFactory: NoSplash.splashFactory,
      tabs: tabs,
    );
  }
}
