part of 'upcoming_movie_cubit.dart';

abstract class UpcomingMovieState extends Equatable {
  const UpcomingMovieState();

  @override
  List<Object?> get props => [];
}

class UpcomingMovieInitial extends UpcomingMovieState {}

class UpcomingMovieLoading extends UpcomingMovieState {}

class UpcomingMovieLoaded extends UpcomingMovieState {
  final List<MovieModel> movies;

  const UpcomingMovieLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class UpcomingMovieError extends UpcomingMovieState {
  final String error;

  const UpcomingMovieError(this.error);

  @override
  List<Object?> get props => [error];
}
