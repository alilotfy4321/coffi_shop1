// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, must_be_immutable

import 'package:coffi_shop/constants/app_dimentions.dart';
import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categerypart1 extends StatelessWidget {
  CoffieShopCubit cubitObject;
  Categerypart1(this.cubitObject, {super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        var cubit = CoffieShopCubit.get(context);
        return Container(
          child: GridView.builder(
            itemCount: cubit.categoryImages.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 40,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                await cubitObject.changeColorForItem(index);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: (cubitObject.selectedCategoryItemIndex == index)
                      ? Colors.brown
                      : Colors.white,
                  borderRadius: BorderRadius.circular(
                    AppDimentions.borderRadiussize(20),
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.brown,
                  ),
                ),
                child: Row(
                  children: [
                    AppDimentions.hSpace(2),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppDimentions.borderRadiussize(15)),
                      child: Image(
                        image: AssetImage(cubit.categoryImages[index]),
                        width: 20,
                        height: 20,
                      ),
                    ),
                    AppDimentions.hSpace(2),
                    Text(
                      cubit.categoryTitles[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


/**
Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < drinkTitles.length; i++)
              Container(
                height: 50,
                margin: EdgeInsets.all(
                  AppDimentions.marginAll(5),
                ),
                padding: EdgeInsets.only(
                  left: AppDimentions.paddingLeft(8),
                  right: AppDimentions.paddingLeft(8),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    AppDimentions.borderRadiussize(15),
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppDimentions.borderRadiussize(15)),
                      child: Image(
                        image: AssetImage(drinkImages[i]),
                        width: 30,
                        height: 30,
                      ),
                    ),
                    AppDimentions.hSpace(5),
                    Text(
                      drinkTitles[i],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
 */