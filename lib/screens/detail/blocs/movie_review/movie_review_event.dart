part of 'movie_review_bloc.dart';

abstract class MovieReviewEvent extends Equatable {
  const MovieReviewEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovieReviews extends MovieReviewEvent {
  final String id;

  const LoadMovieReviews(this.id);

  @override
  List<Object?> get props => [id];
}
