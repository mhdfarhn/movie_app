import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';

AppBar searchAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColor.background,
    centerTitle: true,
    title: Text(
      'Search',
      style: AppTextStyle.body2.copyWith(color: AppColor.brokenWhite),
    ),
  );
}
