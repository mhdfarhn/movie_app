class TokenModel {
  bool? success;
  DateTime? expiresAt;
  String? requestToken;

  TokenModel({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  TokenModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] ?? false,
        expiresAt = json['expires_at'] ?? DateTime(0),
        requestToken = json['request_token'] ?? '';
}
