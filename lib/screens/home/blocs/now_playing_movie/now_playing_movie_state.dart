part of 'now_playing_movie_cubit.dart';

abstract class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object?> get props => [];
}

class NowPlayingMovieInitial extends NowPlayingMovieState {}

class NowPlayingMovieLoading extends NowPlayingMovieState {}

class NowPlayingMovieLoaded extends NowPlayingMovieState {
  final List<MovieModel> movies;

  const NowPlayingMovieLoaded(this.movies);

  @override
  List<Object?> get props => [];
}

class NowPlayingMovieError extends NowPlayingMovieState {
  final String error;

  const NowPlayingMovieError(this.error);

  @override
  List<Object?> get props => [error];
}
