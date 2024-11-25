//-----------// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last, prefer_const_constructors_in_immutables

import 'package:coffi_shop/view/authntication/register_module/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controll/coffie_shop_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
                    colors: const [
                      Color.fromARGB(255, 151, 187, 92),
                      Color.fromARGB(255, 35, 140, 172),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Text(
                  'Sign Up',
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
                padding: EdgeInsets.only(top: 200.0),
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
                      child: RegisterForm(),
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
