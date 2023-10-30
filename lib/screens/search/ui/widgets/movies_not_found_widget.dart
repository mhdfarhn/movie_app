import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_text_style.dart';

import '../../../../core/app_color.dart';

class MoviesNotFoundWidget extends StatelessWidget {
  const MoviesNotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 62.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no-results.png',
            fit: BoxFit.cover,
            height: 76.0.h,
            width: 76.0.w,
          ),
          SizedBox(height: 16.0.h),
          Text(
            'We Are Sorry, We Can Not Find The Movie :(',
            textAlign: TextAlign.center,
            style: AppTextStyle.body2.copyWith(color: AppColor.white),
          ),
          SizedBox(height: 8.0.h),
          Text(
            'Find your movie by type title, categories, years, etc.',
            textAlign: TextAlign.center,
            style: AppTextStyle.caption1.copyWith(color: AppColor.gray),
          ),
        ],
      ),
    );
  }
}
