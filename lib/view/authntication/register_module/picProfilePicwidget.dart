// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable

import 'dart:io';

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PicprofilePicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffieShopCubit, CoffieShopStates>(
      builder: (context, state) {
        var cubit = CoffieShopCubit.get(context);

        return Stack(children: [
          // Circular Avatar
          (cubit.profilePic==null)?CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/coffie/1.jpg'),
          ):CircleAvatar(
            radius: 50,
            backgroundImage: FileImage(File(cubit.profilePic!.path)),
          ),
          // Camera Icon Button
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  cubit.uploadProfilePic(value!);
                });
              },
            ),
          ),
        ]);
      },
    );
  }
}
