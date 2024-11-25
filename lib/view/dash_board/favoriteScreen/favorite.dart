// ignore_for_file: prefer_const_constructors

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
        builder: (context, state) {
      var cubit = CoffieShopCubit.get(context);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Center(child: Text('${cubit.currentLocation}')),
          Center(child: Text('${cubit.currentLatitude}')),
          Center(child: Text('${cubit.currentLngitude}')),
        ],
      );
    });
  }
}
