import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';
import '../../../../core/enums.dart';

part 'top_rated_movie_state.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  final TMDBApiService _tmDBApiService;

  TopRatedMovieCubit(this._tmDBApiService) : super(TopRatedMovieInitial());

  void loadTopRatedMovies() async {
    emit(TopRatedMovieLoading());
    try {
      final List<MovieModel> movies =
          await _tmDBApiService.getMovieListByType(MovieList.topRated);

      emit(TopRatedMovieLoaded(movies));
    } catch (e) {
      emit(TopRatedMovieError(e.toString()));
    }
  }
}
