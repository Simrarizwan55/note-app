import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  LoginModel? appUser;

  _setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  Future<bool> loginUser({
    required String email,
  }) async {
    try {
      _setLoader(true);
      final Uri loginUri = Uri.parse("http://127.0.0.1:8000/api/auth/sign_in/");
      http.Response response = await http.post(
        loginUri,
        body: {
          "email": email,
        },
      );
      response.body;
      Map<String, dynamic> responseBody = jsonDecode(response.body);

      final LoginModel user = LoginModel.fromMap(responseBody);
      String ? accessToken= responseBody['token'];
      if(accessToken!=null) {
        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        await sharedPreferences.setString('accessToken', accessToken);
      }
      appUser=user;
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      _setLoader(false);
    }
  }

}