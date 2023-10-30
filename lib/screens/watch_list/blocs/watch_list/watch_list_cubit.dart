import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/movie_model.dart';
import '../../../../core/data/services/databases/watch_list_box.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final WatchListBox _watchListBox;

  WatchListCubit(this._watchListBox) : super(WatchListInitial());

  void loadWatchList() {
    emit(WatchListLoading());
    try {
      List<MovieModel> movies = _watchListBox.getWatchList();
      emit(WatchListLoaded(movies));
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  void isMovieWatchListed(int id) {
    _watchListBox.isMovieWatchListed(id)
        ? emit(WatchListAdded())
        : emit(WatchListNotAdded());
  }

  void addToWatchList(MovieModel movie) {
    emit(WatchListLoading());
    _watchListBox.putMovieToWatchList(movie);
    emit(WatchListAdded());
  }

  void deleteFromWatchList(int id) {
    emit(WatchListLoading());
    _watchListBox.deleteMovieFromWatchList(id);
    emit(WatchListNotAdded());
  }
}
