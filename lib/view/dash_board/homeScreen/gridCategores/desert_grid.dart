
import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/view/dash_board/homeScreen/gridCategores/parentProductGrid.dart';
import 'package:flutter/material.dart';

class GridDesertItems extends StatelessWidget {
  final CoffieShopCubit cubit;
  final int categoryIndex;
  final List<GridModelProuduct> desertProuducts;
  const GridDesertItems(this.cubit, this.categoryIndex, this.desertProuducts,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomParentGrid(cubit, categoryIndex, desertProuducts);
  }
}