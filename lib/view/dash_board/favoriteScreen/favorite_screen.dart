// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

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
      return ListView.builder(
        itemCount: cubit.favorateList.length,
        itemBuilder: (context, index) => cubit.favorateList[index],
      );
    });
  }
}
