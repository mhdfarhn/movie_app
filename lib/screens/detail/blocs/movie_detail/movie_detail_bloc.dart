import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_detail_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final TMDBApiService _tmDBApiService;

  MovieDetailBloc(this._tmDBApiService) : super(MovieDetailLoading()) {
    on<LoadMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final MovieDetailModel movie =
            await _tmDBApiService.getMovieDetailById(event.id);
        emit(MovieDetailLoaded(movie));
      } catch (e) {
        emit(MovieDetailError(e.toString()));
      }
    });
  }
}
