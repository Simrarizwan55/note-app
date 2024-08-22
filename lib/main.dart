import "package:flutter/material.dart";
import "package:note_app/splash_screen.dart";
import "package:provider/provider.dart";
import "core/notes_list.dart";
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:note_app/flutter_native_splash';

//FUNCTION EXPRESSION
void main() {
  runApp(const MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesList(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Notes App",
        home: SplashScreen(),
      ),
    );
  }
}
