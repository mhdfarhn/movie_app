import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/data/models/movie_review_model.dart';

import '../../../../core/data/services/apis/tmdb_api_service.dart';

part 'movie_review_event.dart';
part 'movie_review_state.dart';

class MovieReviewBloc extends Bloc<MovieReviewEvent, MovieReviewState> {
  final TMDBApiService _tmDBApiService;

  MovieReviewBloc(this._tmDBApiService) : super(MovieReviewLoading()) {
    on<LoadMovieReviews>((event, emit) async {
      emit(MovieReviewLoading());
      try {
        final List<MovieReviewModel> reviews =
            await _tmDBApiService.getMovieReviews(event.id);

        emit(MovieReviewLoaded(reviews));
      } catch (e) {
        emit(MovieReviewError(e.toString()));
      }
    });
  }
}
