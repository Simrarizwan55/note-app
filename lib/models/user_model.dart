class UserModel {
  final String id;
  final String name;
  final String email;
  final String accessToken;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.accessToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["data"]["id"],
      name: map["data"]["name"],
      email: map["data"]["email"],
      accessToken: map["access_token"],
    );
  }
}
