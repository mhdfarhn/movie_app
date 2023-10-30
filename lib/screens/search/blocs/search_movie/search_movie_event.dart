part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object?> get props => [];
}

class SearchMoviesByTitle extends SearchMovieEvent {
  final String title;

  const SearchMoviesByTitle(this.title);

  @override
  List<Object?> get props => [title];
}
