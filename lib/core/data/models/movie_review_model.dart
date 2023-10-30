class MovieReviewModel {
  String? author;
  Map<String, dynamic>? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;

  MovieReviewModel({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  MovieReviewModel.fromJson(Map<String, dynamic> json)
      : author = json['author'] ?? '',
        authorDetails = json['author_details'] ?? Map<String, dynamic>,
        content = json['content'] ?? '',
        createdAt = json['created_at'] ?? '',
        id = json['id'] ?? '',
        updatedAt = json['updatedAt'] ?? '',
        url = json['url'];
}
