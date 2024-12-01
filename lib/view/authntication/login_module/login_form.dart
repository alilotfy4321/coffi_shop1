// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:coffi_shop/constants/app_dimentions.dart';
import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/custom_text_form_field.dart';
import 'package:coffi_shop/customWidgets/custome_button.dart';
import 'package:coffi_shop/view/authntication/register_module/register_screen.dart';
import 'package:coffi_shop/view/dash_board/dash_board..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../customWidgets/navigation.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    //-----------------get cubit instance -----------------------
    var cubit = CoffieShopCubit.get(context);
   //---------------------------------------------------------------
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        return Form(
          key: CoffieShopCubit.loginFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: cubit.signInUserName,
                label: 'userName',
                prefixicon: Icons.person,
              ),

              AppDimentions.vSpace(40),
              CustomTextFormField(
                controller: cubit.signInPassword,
                label: 'password',
                prefixicon: Icons.lock,
              ),
              AppDimentions.vSpace(40),
              CustomButton(
                function: () {
                  if (CoffieShopCubit.loginFormKey.currentState!.validate()) {
                    navigateAndFinishTo(context, DashBoard());
                  }
                },
              ),
              ///////////////////////////////////////////////////////////last part
              AppDimentions.vSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have account ? '),
                  TextButton(
                    onPressed: () => navigateTo(context,RegisterScreen()),
                    child: const Text('Register'),
                  ),
                ],
              ),
              AppDimentions.vSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: AppDimentions.iconSize(40),
                      color: Colors.blue,
                      Icons.facebook,
                    ),
                  ),
                  AppDimentions.hSpace(50),
                  IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.amber,
                        size: AppDimentions.iconSize(40),
                      ),
                      onPressed: () {
                        print("Pressed");
                      }),
                  AppDimentions.hSpace(50),
                  IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.blue,
                        size: AppDimentions.iconSize(40),
                      ),
                      onPressed: () {
                        print("Pressed");
                      }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
