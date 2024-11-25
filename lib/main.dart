// ignore_for_file: prefer_const_constructors

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/core/api/dio_consumer.dart';
import 'package:coffi_shop/view/authntication/login_module/login_screen.dart';
import 'package:coffi_shop/view/authntication/register_module/register_screen.dart';
import 'package:coffi_shop/view/maps/MapLocation.dart';
import 'package:coffi_shop/view/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(create: (context) => CoffieShopCubit(DioConsumer(dio: Dio())), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'signIn': (context) => LoginScreen(),
        'signUp': (context) => RegisterScreen(),
        'showMap': (context) => GettingPosition(),
      },
      home: SplashScreen(),
    );
  }
}
