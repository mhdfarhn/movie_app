import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/screens/detail/ui/widgets/rate_movie_button.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';
import '../../../../core/data/models/movie_model.dart';
import '../../blocs/rate_movie/rate_movie_cubit.dart';

Future<void> showRateMovieModalBottomSheet(
  BuildContext context,
  MovieModel movie,
) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      double rating = double.parse(movie.voteAverage.toStringAsFixed(1));

      context.read<MovieRatingCubit>().isMovieRated(movie.id);

      return BlocConsumer<MovieRatingCubit, MovieRatingState>(
        listener: (context, state) {
          if (state is MovieRatingError) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is MovieRatingSuccess) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Movie rated successfully!')),
            );
          }
        },
        builder: (context, state) {
          rating = state is MovieRated ? state.rating : rating;

          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24.0.h),
                Text(
                  'Rate this movie',
                  style:
                      AppTextStyle.body3.copyWith(color: AppColor.background),
                ),
                SizedBox(height: 20.0.h),
                Text(
                  state is MovieRatingChanged
                      ? state.rating.toString()
                      : rating.toString(),
                  style: AppTextStyle.headline2
                      .copyWith(color: AppColor.background),
                ),
                SizedBox(height: 20.0.h),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Slider(
                      activeColor: AppColor.orange,
                      thumbColor: AppColor.white,
                      value:
                          state is MovieRatingChanged ? state.rating : rating,
                      min: 0.0,
                      max: 10.0,
                      onChanged: (value) {
                        setState(() {});
                        double v = double.parse(value.toStringAsFixed(1));
                        context.read<MovieRatingCubit>().changeMovieRating(v);
                      },
                    );
                  },
                ),
                SizedBox(height: 20.0.h),
                state is MovieRatingLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: AppColor.blue),
                      )
                    : state is MovieRated
                        ? Icon(
                            Icons.check_circle_outline_rounded,
                            color: AppColor.blue,
                            size: 48.0.sp,
                          )
                        : RateMovieButton(
                            movieId: movie.id,
                            rating: state is MovieRatingChanged
                                ? state.rating
                                : rating,
                          ),
                SizedBox(height: 28.0.h),
              ],
            ),
          );
        },
      );
    },
  );
}
