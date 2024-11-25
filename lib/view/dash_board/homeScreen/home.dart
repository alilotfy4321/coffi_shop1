// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_import, unused_element

import 'package:coffi_shop/constants/app_dimentions.dart';
import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/custom_text_form_field.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/gridCategores/breakFast_grid.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/gridCategores/coffie_grid.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/categeryPart1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'gridCategores/desert_grid.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = CoffieShopCubit.get(context);

    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: AppDimentions.marginLeft(20),
                  right: AppDimentions.marginRight(20),
                ),
                child: CustomTextFormField(
                  r: 25,
                  width: double.maxFinite,
                  label: '',
                  hint: 'search',
                  controller: searchControler,
                  prefixicon: Icons.search,
                ),
              ),
              AppDimentions.vSpace(20),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: AppDimentions.fontSize(22),
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppDimentions.vSpace(10),
              Categerypart1(cubit),
              AppDimentions.vSpace(20),
              //-------choice grid categry-----
              choiceGridTOAppear(cubit.selectedCategoryItemIndex,cubit),
            ],
          ),
        ),
      );
    });
  }
}


  choiceGridTOAppear(int index,CoffieShopCubit cubit) {
      switch (index) {
        case 0:
          return  GridCoffieItems(
                      cubit,
                      cubit.selectedCategoryItemIndex,
                      cubit.coffieProuducts,
                    );
        case 1:
          return  GridDesertItems(
                      cubit,
                      cubit.selectedCategoryItemIndex,
                      cubit.desertProuducts,
                    ); 
        case 2:
          return  GridBreakFastItems(
                      cubit,
                      cubit.selectedCategoryItemIndex,
                      cubit.breakFastProuducts,
                    ); 
        case 3:
          return  GridCoffieItems(
                      cubit,
                      cubit.selectedCategoryItemIndex,
                      cubit.frashJuiceProuducts,
                    ); 
        case 4:
          return  GridCoffieItems(
                      cubit,
                      cubit.selectedCategoryItemIndex,
                      cubit.coroissantProuducts,
                    );                                              
      }
    }