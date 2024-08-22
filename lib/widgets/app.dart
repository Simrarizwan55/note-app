import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
  });

  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none),
      ),
    );
  }
}
