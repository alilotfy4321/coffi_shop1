// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

part of 'coffie_shop_cubit.dart';

@immutable
abstract class CoffieShopStates {}

class CoffieShopInitialState extends CoffieShopStates {}

//----------------------------------------------------  sign in----
class SignInLoadingState extends CoffieShopStates {}

class SignInSuccsessState extends CoffieShopStates {}

class SignInErrorState extends CoffieShopStates {
  final error;
  SignInErrorState(this.error);
}
//-------------------------------------- sign up ----

class SignUpLoadingState extends CoffieShopStates {}

class SignUpSuccsessState extends CoffieShopStates {
  String message;
  SignUpSuccsessState(this.message);
}

class SignUPErrorState extends CoffieShopStates {
  final error;
  SignUPErrorState(this.error);
}

class UploadProfilePicState extends CoffieShopStates {}

//----------------------------------bottomNaveBar-----------
class BottomNavBarchangeIndexState extends CoffieShopStates {}

//------------------------------------------category items
class ChangeItemColorState extends CoffieShopStates {}

//----------------------------------grid home page states
class ChoiceGridAppearingImageLoadingState extends CoffieShopStates {}

class ChoiceGridAppearingImageCoffieState extends CoffieShopStates {}

class ChoiceGridAppearingImageDessertState extends CoffieShopStates {}

class ChoiceGridAppearingImageBreakfastState extends CoffieShopStates {}

class ChoiceGridAppearingImageFreashJuiceState extends CoffieShopStates {}

class ChoiceGridAppearingImageCroissantState extends CoffieShopStates {}

class ChoiceGridAppearingImageState extends CoffieShopStates {}

//------------------------------------------------Location permesion---
class AskLocationPermissinState extends CoffieShopStates {}

class GetCurrentLocationState extends CoffieShopStates {}

class GetStreamPositionState extends CoffieShopStates {}

///-------------------------------------------------------- add marker
class AddMarkerState extends CoffieShopStates {}

//-------------------------Selected Drink details  ------
class ChangeDrinkSizeState extends CoffieShopStates {}

class IncrementSweetsOverDrink extends CoffieShopStates {}

class DecrementSweetsOverDrink extends CoffieShopStates {}

class ChoiceSweetTypeState extends CoffieShopStates {}
//---------------------

