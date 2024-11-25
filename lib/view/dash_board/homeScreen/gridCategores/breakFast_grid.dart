// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, unnecessary_null_comparison, unused_local_variable

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/gridCategores/parentProductGrid.dart';
import 'package:flutter/material.dart';

class GridBreakFastItems extends StatelessWidget {
  final CoffieShopCubit cubit;
  final int categoryIndex;
  final List<GridModelProuduct> gridCoffieProduct;
  const GridBreakFastItems(this.cubit, this.categoryIndex, this.gridCoffieProduct,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomParentGrid(cubit, categoryIndex, gridCoffieProduct);
  }
}


