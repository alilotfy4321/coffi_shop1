// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/view/maps/current_position.dart';
import 'package:coffi_shop/view/maps/show_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GettingPosition extends StatelessWidget {
  GettingPosition() {
    checkLocationPermessin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
        builder: (context, state) {
      var cubit = CoffieShopCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Location',
          ),
        ),
        body: ShowMap(cubit),
      );
    });
  }
}
