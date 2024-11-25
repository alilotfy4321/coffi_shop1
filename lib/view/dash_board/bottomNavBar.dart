// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

 bottomNavigationBar (cubit)=>  BottomNavigationBar(
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            onTap: (value) {
              cubit.changeBottomNavIndex(value);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_shopping_cart_sharp,
                  ),
                  label: 'Card'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profie'),
            ],
          );
  