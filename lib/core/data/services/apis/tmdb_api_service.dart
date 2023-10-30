import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/data/models/movie_review_model.dart';
import 'package:movie_app/core/data/models/token_model.dart';

import '../../../enums.dart';
import '../../../env/env.dart';
import '../../models/movie_cast_model.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';

class TMDBApiService {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final Map<String, String> _headers = <String, String>{
    'Authorization': 'Bearer ${Env.tmDBApiKey}',
    'accept': 'application/json',
  };

  Future<TokenModel> createRequestToken() async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$_baseUrl/authentication/token/new'),
        headers: _headers,
      );

      TokenModel token = TokenModel();
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        token = TokenModel.fromJson(responseBody);
      }

      return token;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<MovieModel>> getTopFiveMovies() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(
            '$_baseUrl/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc'),
        headers: _headers,
      );

      final List<MovieModel> results = <MovieModel>[];
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        for (Map<String, dynamic> result in responseBody['results']) {
          if (results.length < 5) {
            results.add(MovieModel.fromJson(result));
          } else {
            break;
          }
        }
      }

      return results;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<MovieModel>> getMovieListByType(MovieList movieListType) async {
    final String type = switch (movieListType) {
      MovieList.nowPlaying => 'now_playing',
      MovieList.upcoming => 'upcoming',
      MovieList.topRated => 'top_rated',
      MovieList.popular => 'popular',
    };

    try {
      final http.Response response = await http.get(
        Uri.parse('$_baseUrl/movie/$type?language=en-US&page=1'),
        headers: _headers,
      );

      final List<MovieModel> movies = <MovieModel>[];
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        for (Map<String, dynamic> result in responseBody['results']) {
          movies.add(MovieModel.fromJson(result));
        }
      }

      return movies;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<MovieDetailModel> getMovieDetailById(String id) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$_baseUrl/movie/$id?language=en-US'),
        headers: _headers,
      );

      MovieDetailModel movieDetail = MovieDetailModel();
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        movieDetail = MovieDetailModel.fromJson(responseBody);
      }

      return movieDetail;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<MovieReviewModel>> getMovieReviews(String id) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$_baseUrl/movie/$id/reviews?language=en-US&page=1'),
        headers: _headers,
      );

      List<MovieReviewModel> reviews = <MovieReviewModel>[];
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        for (Map<String, dynamic> review in responseBody['results']) {
          reviews.add(MovieReviewModel.fromJson(review));
        }
      }

      return reviews;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<MovieCastModel>> getMovieCasts(String movieId) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$_baseUrl/movie/$movieId/credits?language=en-US'),
        headers: _headers,
      );

      final List<MovieCastModel> casts = <MovieCastModel>[];
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        for (Map<String, dynamic> cast in responseBody['cast']) {
          final MovieCastModel movieCast = MovieCastModel.fromJson(cast);
          if (movieCast.knownForDepartment == 'Acting' &&
              movieCast.profilePath != '') {
            casts.add(movieCast);
          }
        }
      }

      return casts;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<MovieModel>> searchMoviesByTitle(String title) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(
            '$_baseUrl/search/movie?query=$title&include_adult=false&language=en-US&page=1'),
        headers: _headers,
      );

      final List<MovieModel> movies = <MovieModel>[];
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        for (Map<String, dynamic> movie in responseBody['results']) {
          movies.add(MovieModel.fromJson(movie));
        }
      }

      return movies;
    } catch (e) {
      throw e.toString();
    }
  }
}
