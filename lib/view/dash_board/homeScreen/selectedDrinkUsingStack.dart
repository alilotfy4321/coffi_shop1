// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, sized_box_for_whitespace, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, use_key_in_widget_constructors, must_be_immutable

import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/drinkDetails/drinkDetails.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/drinkDetails/drinkName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controll/coffie_shop_cubit.dart';

class SelectedDrinkUS extends StatelessWidget {

   GridModelProuduct coffieProuducts;

   SelectedDrinkUS(this.coffieProuducts);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
        builder: (context, state) {
      var cubit = CoffieShopCubit.get(context);
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              //image------
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  image: DecorationImage(
                    image: AssetImage(
                      '${coffieProuducts.image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //pop back-----
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                  left: 20,
                ),
                padding: EdgeInsets.only(
                  left: 5,
                ),
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
              //drink name----
              DrinkName(coffieProuducts.name),

              //drink details--
              Drinkdetails(cubit,coffieProuducts),
            ],
          ),
        ),
      );
    });
  }
}
