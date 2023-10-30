import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';
import '../app_text_style.dart';
import '../data/models/movie_model.dart';
import 'cover_art_card.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: CoverArtCard(
            movie: movie,
          ),
        ),
        SizedBox(width: 12.0.w),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: AppTextStyle.body3.copyWith(color: AppColor.white),
              ),
              SizedBox(height: 16.0.h),
              Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: AppColor.orange,
                    size: 16.0.sp,
                  ),
                  SizedBox(width: 4.0.w),
                  Text(
                    movie.voteAverage.toStringAsFixed(1),
                    style:
                        AppTextStyle.caption1.copyWith(color: AppColor.orange),
                  ),
                ],
              ),
              SizedBox(height: 8.0.h),
              MovieInfoItem(
                icon: Icons.calendar_today_outlined,
                info: movie.releaseDate.substring(0, 4),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MovieInfoItem extends StatelessWidget {
  final IconData icon;
  final String info;

  const MovieInfoItem({
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
          color: AppColor.brokenWhite,
          size: 16.0.sp,
        ),
        SizedBox(width: 4.0.w),
        Text(
          info,
          style: AppTextStyle.caption2.copyWith(color: AppColor.brokenWhite),
        ),
      ],
    );
  }
}
