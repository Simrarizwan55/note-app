import 'package:note_app/login_screen.dart';

class LoginModel {
  final String id;
  final String email;
  final String accessToken;

  LoginModel({
    required this.id,
    required this.email,
    required this.accessToken,
  });

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      id: map["data"]["id"],
      email: map["data"]["email"],
      accessToken: map["access_token"],
    );
  }
}
