import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/registeration.dart';
import 'package:flutter/material.dart';
import 'package:demo/main.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.color, @required this.Onpressed});
  final Color color;
  final String title;
  final Function Onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(45.0),
        child: MaterialButton(
          onPressed: Onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            // 'Log In',
            title, style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
