// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, unnecessary_null_comparison, unused_local_variable

import 'package:coffi_shop/constants/app_dimentions.dart';
import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/customFavorateWidget.dart';
import 'package:coffi_shop/customWidgets/custom_cart_widget.dart';
import 'package:coffi_shop/customWidgets/navigation.dart';
import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/selectedDrinkUsingStack.dart';
import 'package:flutter/material.dart';

class CustomParentGrid extends StatelessWidget {
  final CoffieShopCubit cubit;
  final int categoryIndex;
  final List<GridModelProuduct> model;
  const CustomParentGrid(this.cubit, this.categoryIndex, this.model,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: model.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        //-------------  one product usind index---
        GridModelProuduct selectedProuductList = model[index];

        //---------------
        if (selectedProuductList == null) {
          return CircularProgressIndicator();
        } else {
          return InkWell(
            onTap: () {
              navigateTo(
                context,
                SelectedDrinkUS(
                  selectedProuductList,
                ),
              );
            },
            child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: AssetImage(
                                  selectedProuductList.image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 80,
                            width: 150,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 2,
                          child: IconButton(
                            //-------add new item to favorate list
                            onPressed: () {
                              cubit.favorateList.add(CustomFavorateWidget(
                                  model: selectedProuductList,
                                  cubit: cubit,
                                  index: index));
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppDimentions.vSpace(10),
                    Text(
                      '${selectedProuductList.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppDimentions.vSpace(5),
                    Row(
                      children: [
                        Text('${selectedProuductList.price}\$'),
                        Spacer(),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {
                              cubit.cartList.add(CustomCartWidget(
                                  model: selectedProuductList,
                                  cubit: cubit,
                                  index: index));
                            },
                            icon: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
