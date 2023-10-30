part of 'movie_cast_bloc.dart';

abstract class MovieCastEvent extends Equatable {
  const MovieCastEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovieCasts extends MovieCastEvent {
  final String movieId;

  const LoadMovieCasts(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
