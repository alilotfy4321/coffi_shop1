// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffi_shop/view/authntication/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.brown,
      splashIconSize: 300,
      animationDuration: Duration(
        seconds: 2,
      ),
      splashTransition: SplashTransition.fadeTransition,
      splash: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage("assets/images/splash_image.png"),
      ),
      nextScreen: WelcomeScreen(),
    );
  }
}
