part of 'popular_movie_cubit.dart';

abstract class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object?> get props => [];
}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState {
  final List<MovieModel> movies;

  const PopularMovieLoaded(this.movies);

  @override
  List<Object?> get props => movies;
}

class PopularMovieError extends PopularMovieState {
  final String error;

  const PopularMovieError(this.error);

  @override
  List<Object?> get props => [error];
}
