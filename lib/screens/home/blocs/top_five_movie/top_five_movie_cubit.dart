import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';

part 'top_five_movie_state.dart';

class TopFiveMovieCubit extends Cubit<TopFiveMovieState> {
  final TMDBApiService _tmDBApiService;

  TopFiveMovieCubit(this._tmDBApiService) : super(TopFiveMovieLoading());

  void loadTopFiveMovies() async {
    emit(TopFiveMovieLoading());
    try {
      final List<MovieModel> movies = await _tmDBApiService.getTopFiveMovies();

      emit(TopFiveMovieLoaded(movies));
    } catch (e) {
      emit(TopFiveMovieError(e.toString()));
    }
  }
}
