import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';

AppBar watchListAppBar() {
  return AppBar(
    backgroundColor: AppColor.background,
    centerTitle: true,
    title: Text(
      'Watch List',
      style: AppTextStyle.body2.copyWith(color: AppColor.brokenWhite),
    ),
  );
}
