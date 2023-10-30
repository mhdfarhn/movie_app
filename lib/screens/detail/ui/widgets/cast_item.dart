import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';

class CastItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CastItem({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            imageUrl,
          ),
          radius: 50.0.dm,
        ),
        SizedBox(height: 8.0.h),
        Text(
          name,
          style: AppTextStyle.caption1.copyWith(color: AppColor.white),
        ),
      ],
    );
  }
}
