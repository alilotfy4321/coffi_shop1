import 'package:flutter/material.dart';

class AppDimentions {
  static double height = 803.6;
  static double width = 392.7;

//--------------------------padding modual-----------------------
  static double paddingAll(var value) => height / (height / value);
  static double paddingTop(var topPadding) => height / (height / topPadding);
  static double paddingBottom(var bottomPadding) =>
      height / (height / bottomPadding);
  static double paddingLeft(var leftPadding) => height / (height / leftPadding);

  static double paddingRight(var rightPadding) =>
      height / (height / rightPadding);

//--------------------------margin----------------------
  static double marginAll(var value) => height / (height / value);
  static double marginTop(var topmargin) => height / (height / topmargin);
  static double marginBottom(var bottommargin) =>
      height / (height / bottommargin);
  static double marginLeft(var leftmargin) => height / (height / leftmargin);

  static double marginRight(var rightmargin) => height / (height / rightmargin);
//------------------------------------divider modual------------------------
  static vSpace(var h) => SizedBox(
        height: height / (height / h),
      );

  static hSpace(var w) => SizedBox(
        width: width / (width / w),
      );
//------------------------------container height--------------
  static double containerHeight(var height) => height / (height / height);
  //--------------------------------------------borderRadius-------------------
  static double borderRadiussize(var radius) => height / (height / radius);
//------------------------------------------------fontSize Modual-------------------
  static double fontSize(var size) => height / (height / size);

  //--------------------------------------icon size-----------
  static double iconSize(var size) => height / (height / size);
  //--------------------
}
