import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/services/apis/tmdb_api_service.dart';
import '../../../../core/data/services/databases/rated_movies_box.dart';

part 'rate_movie_state.dart';

class RateMovieCubit extends Cubit<RateMovieState> {
  final TMDBApiService _tmDBApiService;
  final RatedMoviesBox _ratedMoviesBox;

  RateMovieCubit(
    this._tmDBApiService,
    this._ratedMoviesBox,
  ) : super(RateMovieInitial());

  void isMovieRated(int movieId) {
    emit(RateMovieLoading());
    if (_ratedMoviesBox.isMovieRated(movieId)) {
      double rating = _ratedMoviesBox.getRating(movieId);
      emit(MovieRated(rating));
    } else {
      emit(MovieNotRated());
    }
  }

  void rateMovie(int movieId, double rating) {
    emit(RateMovieLoading());
    try {
      _tmDBApiService.addRating(movieId.toString(), rating);
      _ratedMoviesBox.addToRatedMovies(movieId, rating);
      emit(RateMovieSuccess());
    } catch (e) {
      emit(RateMovieError(e.toString()));
    }
  }
}
