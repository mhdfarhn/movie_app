import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/screens/detail/ui/widgets/show_rate_movie_modal_bottom_sheet.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';
import '../../../../core/base_url.dart';
import '../../../../core/data/models/movie_model.dart';

class BannerImageWidget extends StatelessWidget {
  final MovieModel movie;

  const BannerImageWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.0.dm),
            ),
            child: CachedNetworkImage(
              imageUrl: '${BaseUrl.tmdbImage}${movie.backdropPath}',
              fit: BoxFit.cover,
              placeholder: (_, __) => const Center(
                child: CircularProgressIndicator(color: AppColor.blue),
              ),
              errorWidget: (_, __, ___) =>
                  const Icon(Icons.error_outline_rounded),
            ),
          ),
        ),
        Positioned(
          right: 12.0.w,
          bottom: 8.0.h,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.w,
              vertical: 4.0.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColor.darkGray,
            ),
            child: GestureDetector(
              onTap: () {
                showRateMovieModalBottomSheet(context, movie);
              },
              child: Row(
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
            ),
          ),
        ),
      ],
    );
  }
}
