import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';
import '../../../../core/data/models/movie_model.dart';
import '../../blocs/movie_rating/movie_rating_cubit.dart';
import '../../blocs/rate_movie/rate_movie_cubit.dart';

Future<void> showRateMovieModalBottomSheet(
  BuildContext context,
  MovieModel movie,
) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      context.read<RateMovieCubit>().isMovieRated(movie.id);

      double movieRate =
          double.tryParse(movie.voteAverage.toStringAsFixed(1)) ?? 0;

      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 24.0.h),
            Text(
              'Rate this movie',
              style: AppTextStyle.body3.copyWith(color: AppColor.background),
            ),
            SizedBox(height: 20.0.h),
            BlocBuilder<RateMovieCubit, RateMovieState>(
              builder: (context, state) {
                if (state is MovieRated) {
                  movieRate = state.rating;
                  return BlocBuilder<MovieRatingCubit, double>(
                    builder: (context, state) {
                      state = movieRate;
                      return Text(
                        state.toStringAsFixed(1),
                        style: AppTextStyle.headline2
                            .copyWith(color: AppColor.background),
                      );
                    },
                  );
                } else {
                  return BlocBuilder<MovieRatingCubit, double>(
                    builder: (context, state) {
                      state = movieRate;
                      return Text(
                        state.toStringAsFixed(1),
                        style: AppTextStyle.headline2
                            .copyWith(color: AppColor.background),
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(height: 20.0.h),
            StatefulBuilder(
              builder: (context, setState) {
                return Slider(
                  activeColor: AppColor.orange,
                  thumbColor: AppColor.white,
                  value: movieRate,
                  min: 0.0,
                  max: 10.0,
                  onChanged: (value) {
                    setState(() => movieRate = value);
                    context.read<MovieRatingCubit>().addRating(value);
                  },
                );
              },
            ),
            SizedBox(height: 20.0.h),
            BlocConsumer<RateMovieCubit, RateMovieState>(
              listener: (context, state) {
                if (state is RateMovieError) {
                  context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                } else if (state is RateMovieSuccess) {
                  context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Movie rated successfully!')),
                  );
                }
              },
              builder: (context, state) {
                if (state is RateMovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColor.blue),
                  );
                } else if (state is MovieRated) {
                  return Icon(
                    Icons.check_circle_outline_rounded,
                    color: AppColor.blue,
                    size: 48.0.sp,
                  );
                } else {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.blue,
                      padding: EdgeInsets.symmetric(
                        horizontal: 96.0.w,
                        vertical: 20.0.h,
                      ),
                    ),
                    onPressed: () {
                      context.read<RateMovieCubit>().rateMovie(
                            movie.id,
                            double.parse(movieRate.toStringAsFixed(1)),
                          );
                    },
                    child: Text(
                      'OK',
                      style: AppTextStyle.body2.copyWith(color: AppColor.white),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 28.0.h),
          ],
        ),
      );
    },
  );
}
