import 'package:flutter/material.dart';
import 'package:note_app/listing_screen.dart';
import 'package:note_app/widgets/auth_password_text_field.dart';
import 'package:note_app/widgets/auth_text_field.dart';
import 'package:note_app/widgets/primary_button.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureText = true;

  void _toggleObscureText(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/images/side_image.png",
                      height: 200,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        const AuthTextField(
                          hintText: "Enter your name",
                        ),
                        const SizedBox(height: 20),
                        AuthTextField(
                          hintText: "Enter your email",
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email address';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter the valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthPasswordTextField(
                          hintText: "Enter your password",
                          controller: _passwordController,
                          validator: (value){
                            if (value == null || value.isEmpty)
                            {
                              return'Enter your password';
                            }
                            if(value.length<6){
                              return "Password must be at least 6 character long";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthPasswordTextField(
                          hintText: "Confirm Password",
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your confirm password';
                            }
                            if (value != _passwordController.text) {
                              return 'Your password do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListingScreen()),
                              );
                            }
                          },
                          text: "Sign Up",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already Login?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
