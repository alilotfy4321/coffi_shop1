// ignore_for_file: prefer_const_constructors

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/core/api/dio_consumer.dart';
import 'package:coffi_shop/localCache/charedPreference.dart';
import 'package:coffi_shop/view/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.getInit();
  runApp(BlocProvider(
      create: (context) => CoffieShopCubit(DioConsumer(dio: Dio())),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
