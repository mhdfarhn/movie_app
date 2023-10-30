class MovieCastModel {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  MovieCastModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  MovieCastModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] ?? false,
        gender = json['gender'] ?? 0,
        id = json['id'] ?? 0,
        knownForDepartment = json['known_for_department'] ?? '',
        name = json['name'] ?? '',
        originalName = json['original_name'] ?? '',
        popularity = json['popularity'] ?? 0,
        profilePath = json['profile_path'] ?? '',
        castId = json['cast_id'] ?? 0,
        character = json['character'] ?? '',
        creditId = json['credit_id'] ?? '',
        order = json['order'] ?? 0;
}
