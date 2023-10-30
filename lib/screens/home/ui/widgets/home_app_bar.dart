import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: AppColor.background,
    elevation: 0.0,
    titleSpacing: 0.0,
    title: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0.w,
      ),
      child: Text(
        'What do you want to watch?',
        style: AppTextStyle.body1.copyWith(color: AppColor.white),
      ),
    ),
  );
}
