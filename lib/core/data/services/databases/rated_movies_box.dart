import 'package:hive/hive.dart';

late Box ratedMoviesBox;

class RatedMoviesBox {
  bool isMovieRated(int movieId) {
    return ratedMoviesBox.containsKey(movieId);
  }

  void addToRatedMovies(int movieId, double rating) {
    ratedMoviesBox.put(movieId, rating);
  }

  double getRating(int movieId) {
    return ratedMoviesBox.get(movieId);
  }
}
