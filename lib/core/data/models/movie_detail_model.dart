class MovieDetailModel {
  bool? adult;
  String? backdropPath;
  Map<String, dynamic>? belongsToCollection;
  int? budget;
  List? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List? productionCompanies;
  List? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;

  MovieDetailModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] ?? false,
        backdropPath = json['backdrop_path'] ?? '',
        belongsToCollection =
            json['belongs_to_collection'] ?? <String, dynamic>{},
        budget = json['budget'] ?? 0,
        genres = json['genres'] ?? [],
        homepage = json['homepage'] ?? '',
        id = json['id'] ?? 0,
        imdbId = json['imdb_id'] ?? '',
        originalLanguage = json['original_language'] ?? '',
        originalTitle = json['original_title'] ?? '',
        overview = json['overview'] ?? '',
        popularity = json['popularity'] ?? 0,
        posterPath = json['poster_path'] ?? '',
        productionCompanies = json['production_companies'] ?? [],
        productionCountries = json['production_countries'] ?? [],
        releaseDate = json['release_date'] ?? '',
        revenue = json['revenue'] ?? 0,
        runtime = json['runtime'] ?? 0,
        spokenLanguages = json['spoken_languages'] ?? [],
        status = json['status'] ?? '',
        tagline = json['tagline'] ?? '',
        title = json['title'] ?? '',
        video = json['video'] ?? false,
        voteAverage = json['vote_average'] ?? 0,
        voteCount = json['vote_count'] ?? 0;
}
