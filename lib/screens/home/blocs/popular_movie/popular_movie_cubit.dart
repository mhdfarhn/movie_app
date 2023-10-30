import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';
import '../../../../core/enums.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  final TMDBApiService _tmDBApiService;

  PopularMovieCubit(this._tmDBApiService) : super(PopularMovieInitial());

  void loadPopularMovies() async {
    emit(PopularMovieLoading());
    try {
      final List<MovieModel> movies =
          await _tmDBApiService.getMovieListByType(MovieList.popular);

      emit(PopularMovieLoaded(movies));
    } catch (e) {
      emit(PopularMovieError(e.toString()));
    }
  }
}
