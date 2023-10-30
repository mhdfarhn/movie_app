import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';

class EmptyWatchList extends StatelessWidget {
  const EmptyWatchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/magic-box.png',
              fit: BoxFit.cover,
              height: 76.0.h,
              width: 76.0.w,
            ),
            SizedBox(height: 16.0.h),
            Text(
              'There Is No Movie Yet!',
              textAlign: TextAlign.center,
              style: AppTextStyle.body2.copyWith(color: AppColor.brokenWhite),
            ),
            SizedBox(height: 8.0.h),
            Text(
              'Find your movie by type title, categories, years, etc.',
              textAlign: TextAlign.center,
              style: AppTextStyle.caption1.copyWith(color: AppColor.gray),
            ),
          ],
        ),
      ),
    );
  }
}
