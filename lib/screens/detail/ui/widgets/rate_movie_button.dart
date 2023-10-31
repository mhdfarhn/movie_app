import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';
import '../../blocs/rate_movie/rate_movie_cubit.dart';

class RateMovieButton extends StatelessWidget {
  final int movieId;
  final double rating;

  const RateMovieButton({
    super.key,
    required this.movieId,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.blue,
        padding: EdgeInsets.symmetric(
          horizontal: 96.0.w,
          vertical: 20.0.h,
        ),
      ),
      onPressed: () {
        context.read<MovieRatingCubit>().rateMovie(
              movieId,
              double.parse(rating.toStringAsFixed(1)),
            );
      },
      child: Text(
        'OK',
        style: AppTextStyle.body2.copyWith(color: AppColor.white),
      ),
    );
  }
}
