import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 1)
class MovieModel {
  @HiveField(0)
  bool adult;

  @HiveField(1)
  String backdropPath;

  @HiveField(2)
  List genreIds;

  @HiveField(3)
  int id;

  @HiveField(4)
  String originalLanguage;

  @HiveField(5)
  String originalTitle;

  @HiveField(6)
  String overview;

  @HiveField(7)
  num popularity;

  @HiveField(8)
  String posterPath;

  @HiveField(9)
  String releaseDate;

  @HiveField(10)
  String title;

  @HiveField(11)
  bool video;

  @HiveField(12)
  num voteAverage;

  @HiveField(13)
  int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] ?? false,
        backdropPath = json['backdrop_path'] ?? '',
        genreIds = json['genre_ids'] ?? [],
        id = json['id'] ?? 0,
        originalLanguage = json['original_language'] ?? '',
        originalTitle = json['original_title'] ?? '',
        overview = json['overview'] ?? '',
        popularity = json['popularity'] ?? 0,
        posterPath = json['poster_path'] ?? '',
        releaseDate = json['release_date'] ?? '',
        title = json['title'] ?? '',
        video = json['video'] ?? false,
        voteAverage = json['vote_average'] ?? 0,
        voteCount = json['vote_count'] ?? 0;
}
