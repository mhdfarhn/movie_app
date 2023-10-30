import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    actions: [
      Padding(
        padding: EdgeInsets.only(
          right: 24.0.w,
        ),
        child: Icon(
          Icons.info_outline_rounded,
          color: AppColor.white,
          size: 24.0.sp,
        ),
      )
    ],
  );
}
