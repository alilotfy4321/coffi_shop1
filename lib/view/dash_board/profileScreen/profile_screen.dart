// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:io';

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/hvSpaces.dart';
import 'package:coffi_shop/customWidgets/navigation.dart';
import 'package:coffi_shop/view/dash_board/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        var cubit = CoffieShopCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSpace(20),
              Center(
                child: (cubit.profilePic == null)
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/coffie/1.jpg'),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            FileImage(File(cubit.profilePic!.path)),
                      ),
              ),
              vSpace(40),
              Text('Settings :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              vSpace(20),
              //----1
              ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text('${cubit.signUpPhone.text}'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                    )),
              ),
              //----2
              ListTile(
                leading: Icon(
                  Icons.location_on,
                ),
                title: Text('${cubit.currentLocation}'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                    )),
              ),
              //----3
              ListTile(
                leading: Icon(
                  Icons.shopping_cart_outlined,
                ),
                title: Text('My Cart'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
