// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:coffi_shop/constants/app_dimentions.dart';
import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/custome_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

double? screenHeight;
double? screenWidth;
var screenSize;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //------------------------------screen dimentions---------
    screenSize = MediaQuery.of(context).size;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print(screenSize);
    //--------------------------------------------------------
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        //------cubit object-------
        var cubit = CoffieShopCubit.get(context);
        //--------------

        return Scaffold(
          extendBodyBehindAppBar: true,
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: AppDimentions.paddingTop(100),
                left: AppDimentions.paddingLeft(40),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: AppDimentions.fontSize(32),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppDimentions.vSpace(10),
                  Text(
                    'injoy with your app',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppDimentions.fontSize(22),
                    ),
                  ),
                  AppDimentions.vSpace(200),
                  CustomButton(function: () {
                    cubit.navigateToSignIn(context);
                  }),
                  AppDimentions.vSpace(50),
                  CustomButton(
                    text: 'Sign Up',
                    backgroundColor: Color.fromARGB(255, 187, 132, 132),
                    function: () => cubit.navigateToSignUp(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
