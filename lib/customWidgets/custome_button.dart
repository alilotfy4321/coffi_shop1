// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

Widget CustomButton({
  double width = 300,
  double height = 50,
  required void Function()? function,
  String text = 'Sign In',
  Color? backgroundColor = Colors.blue,
  Color? foregroundColor = Colors.white,
  double textFontSize = 26,
}) {
  return Container(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontSize: textFontSize,
        ),
      ),
    ),
  );
}
