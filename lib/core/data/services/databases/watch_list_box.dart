import 'package:hive/hive.dart';

import '../../models/movie_model.dart';

late Box watchListBox;

class WatchListBox {
  bool isMovieWatchListed(int id) {
    return watchListBox.containsKey(id);
  }

  void putMovieToWatchList(MovieModel movie) {
    watchListBox.put(movie.id, movie);
  }

  List<MovieModel> getWatchList() {
    final List<MovieModel> movies = <MovieModel>[];

    for (var key in watchListBox.keys) {
      MovieModel movie = watchListBox.get(key);
      movies.add(movie);
    }

    return movies;
  }

  void deleteMovieFromWatchList(int id) {
    watchListBox.delete(id);
  }

  void deleteWatchList() {
    watchListBox.clear();
  }
}
