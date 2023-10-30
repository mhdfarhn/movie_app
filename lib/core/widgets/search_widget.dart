import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';
import '../app_text_style.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onTap;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.button.copyWith(color: AppColor.white),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            style: BorderStyle.none,
            width: 0.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.0.w,
          vertical: 12.0.h,
        ),
        filled: true,
        fillColor: AppColor.darkGray,
        labelText: 'Search',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: AppTextStyle.button.copyWith(color: AppColor.gray),
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            Icons.search,
            color: AppColor.gray,
            size: 32.0.sp,
          ),
        ),
      ),
    );
  }
}
