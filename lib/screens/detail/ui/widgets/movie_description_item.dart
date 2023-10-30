import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';

class MovieDescriptionItem extends StatelessWidget {
  final IconData icon;
  final String info;

  const MovieDescriptionItem({
    super.key,
    required this.icon,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.gray,
          size: 16.0.sp,
        ),
        SizedBox(width: 4.0.w),
        Text(
          info,
          style: AppTextStyle.caption1.copyWith(color: AppColor.gray),
        ),
      ],
    );
  }
}
