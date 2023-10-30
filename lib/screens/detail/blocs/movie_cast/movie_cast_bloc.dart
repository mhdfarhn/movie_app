import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_cast_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';

part 'movie_cast_event.dart';
part 'movie_cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  final TMDBApiService _tmDBApiService;

  MovieCastBloc(this._tmDBApiService) : super(MovieCastLoading()) {
    on<LoadMovieCasts>((event, emit) async {
      emit(MovieCastLoading());
      try {
        final List<MovieCastModel> casts =
            await _tmDBApiService.getMovieCasts(event.movieId);

        emit(MovieCastLoaded(casts));
      } catch (e) {
        emit(MovieCastError(e.toString()));
      }
    });
  }
}
