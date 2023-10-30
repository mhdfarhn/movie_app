import 'package:flutter/material.dart';

import '../app_color.dart';
import '../app_text_style.dart';

class TabBarWidget extends StatelessWidget {
  final List<Tab> tabs;
  final TabController controller;

  const TabBarWidget({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      dividerColor: AppColor.background,
      indicatorColor: AppColor.darkGray,
      isScrollable: true,
      labelColor: AppColor.white,
      unselectedLabelColor: AppColor.gray,
      labelStyle: AppTextStyle.button,
      unselectedLabelStyle: AppTextStyle.button,
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      tabs: tabs,
    );
  }
}
