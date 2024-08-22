import 'package:flutter/material.dart';
import 'package:note_app/listing_screen.dart';
import 'package:note_app/signup_screen.dart';
import 'package:note_app/widgets/auth_password_text_field.dart';
import 'package:note_app/widgets/auth_text_field.dart';
import 'package:note_app/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState()=> _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  final _formKey= GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Form(
        key: _formKey,
        child:Column(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
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
                      "Login",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                     AuthTextField(
                      hintText: "Enter your email",
                      controller: _emailController,
                       validator: (value) {
                        if (value == null || value.isEmpty)
                          {
                            return'Enter your email address';
                          }
                        if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                          {
                            return 'Enter valid email address';
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
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListingScreen()),
                          );
                        }
                      },
                      text: "Login",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
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
                                  builder: (context) => const SignupScreen()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
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
