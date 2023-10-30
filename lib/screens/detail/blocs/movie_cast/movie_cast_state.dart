part of 'movie_cast_bloc.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object?> get props => [];
}

class MovieCastLoading extends MovieCastState {}

class MovieCastLoaded extends MovieCastState {
  final List<MovieCastModel> casts;

  const MovieCastLoaded(this.casts);

  @override
  List<Object?> get props => [casts];
}

class MovieCastError extends MovieCastState {
  final String error;

  const MovieCastError(this.error);

  @override
  List<Object?> get props => [error];
}
