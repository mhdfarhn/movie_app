part of 'movie_review_bloc.dart';

abstract class MovieReviewState extends Equatable {
  const MovieReviewState();

  @override
  List<Object> get props => [];
}

class MovieReviewLoading extends MovieReviewState {}

class MovieReviewLoaded extends MovieReviewState {
  final List<MovieReviewModel> reviews;

  const MovieReviewLoaded(this.reviews);

  @override
  List<Object> get props => [reviews];
}

class MovieReviewError extends MovieReviewState {
  final String error;

  const MovieReviewError(this.error);

  @override
  List<Object> get props => [error];
}
