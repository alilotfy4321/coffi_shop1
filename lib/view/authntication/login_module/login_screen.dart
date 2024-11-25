// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:coffi_shop/view/authntication/login_module/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controll/coffie_shop_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 151, 187, 92),
                      Color.fromARGB(255, 35, 140, 172),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Text(
                  'LOgin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                top: 100,
                left: 50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 250.0),
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: SingleChildScrollView(
                      child: LoginForm(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
