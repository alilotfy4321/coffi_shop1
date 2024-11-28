// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_super_parameters
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:coffi_shop/customWidgets/hvSpaces.dart';
import 'package:coffi_shop/model/gridModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomCartWidget extends StatelessWidget {
  final GridModelProuduct model;
  final CoffieShopCubit cubit;
  int index;
  CustomCartWidget( {super.key, 
    required this.model,
    required this.cubit,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //--------1 image--
                Container(
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(
                          '${model.image}',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                hSpace(20),
                //----------2 coulnm

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${model.name}'),
                    vSpace(5),
                    Text('${model.price} \$'),
                    
                    
                  ],
                ),
                Spacer(),
                //----------------------3
                Column(
                  children: [
                    Container(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_half,
                            color: const Color.fromARGB(255, 37, 44, 39),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('4.4'),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          cubit.removeListItem(index);
                        },
                        child: const Text('remove')),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
    
  }
}
