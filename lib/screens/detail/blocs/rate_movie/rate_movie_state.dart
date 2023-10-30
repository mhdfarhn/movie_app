part of 'rate_movie_cubit.dart';

abstract class RateMovieState extends Equatable {
  const RateMovieState();

  @override
  List<Object?> get props => [];
}

class RateMovieInitial extends RateMovieState {}

class RateMovieLoading extends RateMovieState {}

class MovieRated extends RateMovieState {
  final double rating;

  const MovieRated(this.rating);

  @override
  List<Object?> get props => [rating];
}

class MovieNotRated extends RateMovieState {}

class RateMovieSuccess extends RateMovieState {}

class RateMovieError extends RateMovieState {
  final String error;

  const RateMovieError(this.error);

  @override
  List<Object?> get props => [error];
}
