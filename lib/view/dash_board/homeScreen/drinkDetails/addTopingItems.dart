// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/hvSpaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTopingItem extends StatelessWidget {
  final title;
  final CoffieShopCubit cubit;
  const AddTopingItem(this.cubit, {this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Row(
        
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 73, 34, 24),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  cubit.decrementSweetsOverDrink('$title');
                },
                icon: Icon(
                  size: 15,
                  CupertinoIcons.minus,
                  color: Colors.white,
                ),
              ),
            ),
            hSpace(5),
            Text(
              '  ${cubit.choiceSweetType(title)} ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  cubit.incrementSweetsOverDrink('$title');
                },
                icon: Icon(
                  size: 15,
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
