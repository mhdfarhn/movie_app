import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/movie_detail/movie_detail_bloc.dart';
import 'detail_widgets.dart';

class MovieDescriptionWidget extends StatelessWidget {
  const MovieDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MovieDescriptionItem(
              icon: Icons.calendar_today_outlined,
              info: state is MovieDetailLoaded
                  ? state.movie.releaseDate!.substring(0, 4)
                  : '',
            ),
            const MovieDescriptionDivider(),
            MovieDescriptionItem(
              icon: Icons.watch_later_outlined,
              info: state is MovieDetailLoaded
                  ? '${state.movie.runtime} Minutes'
                  : ' Minutes',
            ),
            const MovieDescriptionDivider(),
            MovieDescriptionItem(
              icon: Icons.movie_outlined,
              info: state is MovieDetailLoaded
                  ? state.movie.genres![0]['name']
                  : '',
            ),
          ],
        );
      },
    );
  }
}
