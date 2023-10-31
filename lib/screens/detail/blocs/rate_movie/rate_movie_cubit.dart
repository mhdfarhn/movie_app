import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/services/apis/tmdb_api_service.dart';
import '../../../../core/data/services/databases/rated_movies_box.dart';

part 'rate_movie_state.dart';

class MovieRatingCubit extends Cubit<MovieRatingState> {
  final TMDBApiService _tmDBApiService;
  final RatedMoviesBox _ratedMoviesBox;

  MovieRatingCubit(
    this._tmDBApiService,
    this._ratedMoviesBox,
  ) : super(MovieRatingInitial());

  void isMovieRated(int movieId) {
    emit(MovieRatingLoading());
    if (_ratedMoviesBox.isMovieRated(movieId)) {
      double rating = _ratedMoviesBox.getRating(movieId);
      emit(MovieRated(rating));
    } else {
      emit(MovieNotRated());
    }
  }

  void changeMovieRating(double rating) {
    emit(MovieRatingChanged(rating));
  }

  void rateMovie(int movieId, double rating) {
    emit(MovieRatingLoading());
    try {
      _tmDBApiService.addRating(movieId.toString(), rating);
      _ratedMoviesBox.addToRatedMovies(movieId, rating);
      emit(MovieRatingSuccess());
    } catch (e) {
      emit(MovieRatingError(e.toString()));
    }
  }
}
