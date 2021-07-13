import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  bool obscureText;
  String hintText;
  TextEditingController controller;
  FormFieldValidator<String>? validator;
  TextInputType keyboardType;
  CustomTextField(
      {required this.hintText,
      required this.obscureText,
      required this.validator,
      required this.controller,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white30,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple.shade300,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple.shade300,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
