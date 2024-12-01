import 'package:flutter/material.dart';

void navigateTo(context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinishTo(context, Widget widget) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    
  );
}