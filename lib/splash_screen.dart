import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/listing_screen.dart';
import 'package:note_app/login_screen.dart';
import 'package:note_app/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  void timer() async {
    bool onBoardingSeen = await hasSeenOnboarding();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString('accessToken');
    if (accessToken != null) {
      bool findUser = await fetchUser(accessToken);
      if (findUser) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => ListingScreen(),
            )
        );
      }
      else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )
        );
      }
    } else{
      Timer(const Duration(seconds: 2), ()
      {
        Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) =>
              onBoardingSeen
                  ? LoginScreen()
                  : OnboardScreen()
          ),
        );
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // The UI part here doesn't matter much, as the native splash screen will be displayed first
    return Scaffold(
      // body: Center(child: CircularProgressIndicator()), // Optional loading indicator
    );
  }
  Future<bool> hasSeenOnboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = sharedPreferences.getBool("hasSeenOnboarding") ?? false;
    if (!hasSeenOnboarding) {
      sharedPreferences.setBool("hasSeenOnboarding", true);
    }
    return hasSeenOnboarding;
  }
}

Future<bool> fetchUser(String token) async {
  try {
    final Uri userUri = Uri.parse("http://127.0.0.1:8000/api/auth/sign_in/");
    http.Response response = await http.get(userUri);
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
