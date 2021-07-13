import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  VoidCallback? onPressed;
  CustomButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      child: RaisedButton(
          elevation: 5,
          onPressed: onPressed,
          child: Text(buttonText,
              style: TextStyle(color: Colors.white, fontSize: 20)),
          shape: StadiumBorder(),
          color: Colors.purple[400]),
    );
  }
}
