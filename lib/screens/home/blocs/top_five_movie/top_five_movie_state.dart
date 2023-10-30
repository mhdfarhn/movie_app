part of 'top_five_movie_cubit.dart';

class TopFiveMovieState extends Equatable {
  const TopFiveMovieState();

  @override
  List<Object?> get props => [];
}

class TopFiveMovieInitial extends TopFiveMovieState {}

class TopFiveMovieLoading extends TopFiveMovieState {}

class TopFiveMovieLoaded extends TopFiveMovieState {
  final List<MovieModel> movies;

  const TopFiveMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class TopFiveMovieError extends TopFiveMovieState {
  final String error;

  const TopFiveMovieError(this.error);

  @override
  List<Object> get props => [error];
}
