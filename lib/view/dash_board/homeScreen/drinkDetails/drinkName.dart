// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, override_on_non_overriding_member, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class DrinkName extends StatelessWidget{
  final String selectedTitle;
  const DrinkName(this.selectedTitle,{super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 235,
        right: 50,
        left: 50,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(136, 190, 190, 190),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$selectedTitle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                Text(
                  ' 4.9',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
