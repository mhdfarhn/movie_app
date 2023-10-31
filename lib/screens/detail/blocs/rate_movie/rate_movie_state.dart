part of 'rate_movie_cubit.dart';

abstract class MovieRatingState extends Equatable {
  const MovieRatingState();

  @override
  List<Object?> get props => [];
}

class MovieRatingInitial extends MovieRatingState {}

class MovieRatingLoading extends MovieRatingState {}

class MovieNotRated extends MovieRatingState {}

class MovieRated extends MovieRatingState {
  final double rating;

  const MovieRated(this.rating);

  @override
  List<Object?> get props => [rating];
}

class MovieRatingChanged extends MovieRatingState {
  final double rating;

  const MovieRatingChanged(this.rating);

  @override
  List<Object?> get props => [rating];
}

class MovieRatingSuccess extends MovieRatingState {}

class MovieRatingError extends MovieRatingState {
  final String error;

  const MovieRatingError(this.error);

  @override
  List<Object?> get props => [error];
}
