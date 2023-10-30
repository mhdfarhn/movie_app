import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';
import '../../../../core/enums.dart';

part 'upcoming_movie_state.dart';

class UpcomingMovieCubit extends Cubit<UpcomingMovieState> {
  final TMDBApiService _tmDBApiService;

  UpcomingMovieCubit(this._tmDBApiService) : super(UpcomingMovieInitial());

  void loadUpcomingMovies() async {
    emit(UpcomingMovieLoading());
    try {
      final List<MovieModel> movies =
          await _tmDBApiService.getMovieListByType(MovieList.upcoming);

      emit(UpcomingMovieLoaded(movies));
    } catch (e) {
      emit(UpcomingMovieError(e.toString()));
    }
  }
}
