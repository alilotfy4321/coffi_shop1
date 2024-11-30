// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import, unnecessary_string_interpolations

import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/view/dash_board/bottomNavBar.dart';
import 'package:coffi_shop/view/dash_board/cart_screen/cart_screen.dart';
import 'package:coffi_shop/view/dash_board/favoriteScreen/favorite_screen.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/home.dart';
import 'package:coffi_shop/view/dash_board/profileScreen/profile_screen.dart';
import 'package:coffi_shop/view/maps/MapLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controll/coffie_shop_cubit.dart';
import '../../customWidgets/navigation.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> appBarTitles = [
      'DashBoard',
      'Favorate',
      'Cart',
      'profile',
    ];
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        var cubit = CoffieShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                navigateTo(context, GettingPosition());
              },
              icon: Icon(
                Icons.location_pin,
              ),
            ),
            title: Text('${appBarTitles[cubit.currentIndex]}'),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  AlertDialog(
                          title:  Text("Order fast delevery "),
                          content:  Row(
                            children: [
                              TextButton(onPressed: (){}, child: Text('Order'),),
                              Text("+201554534204"),
                            ],
                          ),
                        );
                      },);
                },
                icon: Icon(
                  Icons.phone,
                ),
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: bottomNavigationBar(cubit),
        );
      },
    );
  }
}
