import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';
import '../../../../core/base_url.dart';
import '../../../../core/data/models/movie_review_model.dart';

class ReviewCard extends StatelessWidget {
  final MovieReviewModel review;

  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 22.0.dm,
                backgroundImage: review.authorDetails!['avatar_path'] != null
                    ? CachedNetworkImageProvider(
                        '${BaseUrl.tmdbImage}/${review.authorDetails!['avatar_path']}')
                    : null,
                child: review.authorDetails!['avatar_path'] != null
                    ? null
                    : const Icon(Icons.person),
              ),
              SizedBox(height: 14.0.h),
              Text(
                review.authorDetails!['rating'] != null
                    ? review.authorDetails!['rating'].toStringAsFixed(1)
                    : '-',
                style: AppTextStyle.caption1.copyWith(color: AppColor.blue),
              ),
            ],
          ),
          SizedBox(width: 12.0.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.author!,
                  style: AppTextStyle.caption1.copyWith(color: AppColor.white),
                ),
                SizedBox(height: 4.0.h),
                Text(
                  review.content!,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.caption1.copyWith(color: AppColor.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
