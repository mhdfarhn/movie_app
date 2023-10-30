import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_router.dart';
import '../../../../core/data/models/movie_model.dart';
import '../../../../core/widgets/cover_art_card.dart';
import '../../../../core/widgets/error_text.dart';
import '../../blocs/popular_movie/popular_movie_cubit.dart';

class PopularMovieContent extends StatelessWidget {
  const PopularMovieContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.blue),
          );
        } else if (state is PopularMovieError) {
          return ErrorText(text: state.error);
        } else if (state is PopularMovieLoaded) {
          final List<MovieModel> movies = state.movies;
          return StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0.h,
            crossAxisSpacing: 12.0.w,
            children: List.generate(
              movies.length,
              (index) {
                return GestureDetector(
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
                  child: CoverArtCard(movie: movies[index]),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
