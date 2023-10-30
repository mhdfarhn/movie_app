import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_router.dart';
import '../../../../core/data/models/movie_model.dart';
import '../../../../core/widgets/movie_card.dart';

class MoviesFoundWidget extends StatelessWidget {
  final List<MovieModel> movies;

  const MoviesFoundWidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        movies.length,
        (index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 24.0.w,
              right: 24.0.w,
              bottom: 24.0.h,
            ),
            child: GestureDetector(
              onTap: () {
                context.goNamed(
                  AppRouter.detail,
                  extra: {
                    'movie': movies[index],
                    'path': AppRouter.search,
                  },
                  pathParameters: {
                    'id': movies[index].id.toString(),
                  },
                );
              },
              child: MovieCard(movie: movies[index]),
            ),
          );
        },
      ),
    );
  }
}
