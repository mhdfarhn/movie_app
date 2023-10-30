import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_model.dart';
import '../../../../core/data/services/apis/tmdb_api_service.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final TMDBApiService _tmDBApiService;

  SearchMovieBloc(this._tmDBApiService) : super(SearchMovieInitial()) {
    on<SearchMoviesByTitle>((event, emit) async {
      emit(SearchMovieLoading());
      try {
        final List<MovieModel> movies =
            await _tmDBApiService.searchMoviesByTitle(event.title);

        emit(SearchMovieLoaded(movies));
      } catch (e) {
        emit(SearchMovieError(e.toString()));
      }
    });
  }
}
