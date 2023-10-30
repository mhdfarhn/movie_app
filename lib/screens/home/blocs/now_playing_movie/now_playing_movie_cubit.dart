import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';
import '../../../../core/enums.dart';

part 'now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  final TMDBApiService _tmDBApiService;

  NowPlayingMovieCubit(this._tmDBApiService) : super(NowPlayingMovieInitial());

  void loadNowPlayingMovies() async {
    emit(NowPlayingMovieLoading());
    try {
      final List<MovieModel> movies =
          await _tmDBApiService.getMovieListByType(MovieList.popular);

      emit(NowPlayingMovieLoaded(movies));
    } catch (e) {
      emit(NowPlayingMovieError(e.toString()));
    }
  }
}
