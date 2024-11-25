// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import

import 'package:coffi_shop/constants/navigation.dart';
import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/view/dash_board/bottomNavBar.dart';
import 'package:coffi_shop/view/dash_board/cardScreen/card_screen.dart';
import 'package:coffi_shop/view/dash_board/favoriteScreen/favorite.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/home.dart';
import 'package:coffi_shop/view/dash_board/profileScreen/profile_screen.dart';
import 'package:coffi_shop/view/maps/MapLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controll/coffie_shop_cubit.dart';

class DashBoard extends StatelessWidget {

const DashBoard({super.key});

  

  @override
  Widget build(BuildContext context) {
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
            title: Text('dashBoard '),
            actions: [
              IconButton(
                onPressed: () {},
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
