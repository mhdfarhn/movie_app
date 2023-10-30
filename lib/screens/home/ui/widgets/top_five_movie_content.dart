import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/screens/home/ui/widgets/top_movie_card.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_router.dart';
import '../../../../core/data/models/movie_model.dart';
import '../../../../core/widgets/error_text.dart';
import '../../blocs/top_five_movie/top_five_movie_cubit.dart';

class TopFiveMovieContent extends StatelessWidget {
  const TopFiveMovieContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopFiveMovieCubit, TopFiveMovieState>(
      builder: (context, state) {
        if (state is TopFiveMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.blue),
          );
        } else if (state is TopFiveMovieError) {
          return ErrorText(text: state.error);
        } else if (state is TopFiveMovieLoaded) {
          final List<MovieModel> movies = state.movies;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                movies.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 20.0.w),
                  child: TopMovieCard(
                    position: (index + 1).toString(),
                    movie: movies[index],
                    onTap: () {
                      context.goNamed(
                        AppRouter.detail,
                        extra: {
                          'movie': movies[index],
                          'path': AppRouter.home,
                        },
                        pathParameters: {
                          'id': movies[index].id.toString(),
                        },
                      );
                    },
                  ),
                ),
              )..insert(
                  0,
                  SizedBox(width: 24.0.w),
                ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
