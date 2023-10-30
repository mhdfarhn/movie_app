part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object?> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieModel> movies;

  const SearchMovieLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class SearchMovieError extends SearchMovieState {
  final String error;

  const SearchMovieError(this.error);

  @override
  List<Object?> get props => [error];
}
