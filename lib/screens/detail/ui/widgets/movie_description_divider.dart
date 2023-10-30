import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';

class MovieDescriptionDivider extends StatelessWidget {
  const MovieDescriptionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.0.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.0.w,
      ),
      child: const VerticalDivider(
        color: AppColor.gray,
      ),
    );
  }
}
