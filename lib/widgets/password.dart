import 'package:flutter/material.dart';
import 'app.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key,  required this.hintText});

  final String hintText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  AppTextField(hintText: widget.hintText, obscureText: obscureText,);
    //suffixIcon: IconButton(
    //  icon: Icon(
    //obscureText ? Icons.visibility_off : Icons.visibility,

  }
}
