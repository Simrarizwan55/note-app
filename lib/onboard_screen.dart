import "package:flutter/material.dart";
import "package:note_app/widgets/primary_button.dart";
import "login_screen.dart";

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context)
   {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                text: "Continue",
              ),
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(
                  'assets/images/main_screen.PNG',
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "All Thought. \nOne Place.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20),
              const Text(
                "Dive right in and clear that mind of yours by writing your thoughts down.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
              ]
            )
        )
    ),
    );
  }
  }

