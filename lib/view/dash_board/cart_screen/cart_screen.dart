// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/navigation.dart';
import 'package:coffi_shop/view/dash_board/cart_screen/payment_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
        builder: (context, state) {
      var cubit = CoffieShopCubit.get(context);
      return Stack(
        children: [
          ListView.builder(
            itemCount: cubit.cartList.length,
            itemBuilder: (context, index) => cubit.cartList[index],
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 159, 168, 179),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    'Total Price = 20 \$',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        navigateTo(context, PaymentScreen(price: 20.0));
                      },
                      child: Text(
                        'Pay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
