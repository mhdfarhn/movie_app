import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/cover_art_card.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';
import '../../../../core/data/models/movie_model.dart';

class TopMovieCard extends StatelessWidget {
  final String position;
  final MovieModel movie;
  final void Function() onTap;

  const TopMovieCard({
    super.key,
    required this.position,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 150.0.w,
        height: 230.0.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 210.0.h,
                width: 140.0.w,
                child: CoverArtCard(
                  movie: movie,
                ),
              ),
            ),
            Positioned(
              bottom: -30.0.h,
              left: 0.0,
              child: Stack(
                children: [
                  Text(
                    position,
                    style: AppTextStyle.headline1.copyWith(
                      foreground: Paint()
                        ..color = AppColor.blue
                        ..strokeWidth = 0.5.sp
                        ..style = PaintingStyle.stroke,
                    ),
                  ),
                  Text(
                    position,
                    style: AppTextStyle.headline1
                        .copyWith(color: AppColor.darkGray),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
