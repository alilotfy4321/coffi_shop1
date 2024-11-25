// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/hvSpaces.dart';
import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/drinkDetails/addTopingItems.dart';
import 'package:flutter/material.dart';

class Drinkdetails extends StatelessWidget {
  final CoffieShopCubit cubit;
    final GridModelProuduct coffieProuducts;
  const Drinkdetails(this.cubit,this.coffieProuducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 300,
      ),
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coffie Size',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          vSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              3,
              (index) => InkWell(
                onTap: () {
                  cubit.changeDrinkSize(index, cubit.drinkSize[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: (cubit.currentDrinkSize == index)
                          ? Colors.brown
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    '${cubit.drinkSize[index]}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          vSpace(10),
          //about text----------------
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                vSpace(10),
                Text(
                  'Coffee does more than boost your energy. A few daily cups of coffee may also lower your risk of type 2 diabetes and depression. ',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          //--------Add toping------------
          vSpace(10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Toping (1\$)',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                vSpace(5),
                AddTopingItem(
                  cubit,
                  title: 'Carmel',
                ),
                vSpace(5),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                vSpace(5),
                AddTopingItem(
                  cubit,
                  title: 'Banana',
                ),
                vSpace(5),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                vSpace(5),
                AddTopingItem(
                  cubit,
                  title: 'Choclate',
                ),
                vSpace(5),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                vSpace(5),
                AddTopingItem(
                  cubit,
                  title: 'Strowberry',
                ),
                vSpace(5),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          //-------------add to cart----
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 50,
              left: 50,
            ),
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 46, 17, 17),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    print('add to cart');
                  },
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '4 \$',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
