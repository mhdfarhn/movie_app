part of 'watch_list_cubit.dart';

abstract class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object?> get props => [];
}

class WatchListInitial extends WatchListState {}

class WatchListLoading extends WatchListState {}

class WatchListAdded extends WatchListState {}

class WatchListNotAdded extends WatchListState {}

class WatchListLoaded extends WatchListState {
  final List<MovieModel> movies;

  const WatchListLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class WatchListError extends WatchListState {
  final String error;

  const WatchListError(this.error);

  @override
  List<Object?> get props => [error];
}
