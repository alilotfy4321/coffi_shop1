// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names, prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, prefer_const_constructors, curly_braces_in_flow_control_structures, unnecessary_brace_in_string_interps

import 'package:coffi_shop/core/api/api_comsumer.dart';
import 'package:coffi_shop/core/api/endPoints.dart';
import 'package:coffi_shop/core/errors/exeptions.dart';
import 'package:coffi_shop/core/functions/upload_image_to_api.dart';
import 'package:coffi_shop/localCache/charedPreference.dart';
import 'package:coffi_shop/model/gridModel.dart';
import 'package:coffi_shop/model/signInModel.dart';
import 'package:coffi_shop/model/signUpModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../view/dash_board/cart_screen/cart_screen.dart';
import '../view/dash_board/favoriteScreen/favorite_screen.dart';
import '../view/dash_board/homeScreen/home.dart';
import '../view/dash_board/profileScreen/profile_screen.dart';

part 'coffie_shop_state.dart';

class CoffieShopCubit extends Cubit<CoffieShopStates> {
  CoffieShopCubit(this.api) : super(CoffieShopInitialState());

  static CoffieShopCubit get(context) => BlocProvider.of(context);
//-------------------clean code_--------
  final ApiConsumer api;
//---------appBar titles---
  List<String> appBarTitles = [
    'DashBoard',
    'Favorate',
    'Cart',
    'profile',
  ];
//----------------------------------signIn data------
  static final loginFormKey = GlobalKey<FormState>();
  final TextEditingController signInUserName = TextEditingController();
  final TextEditingController signInPassword = TextEditingController();

  SignInModel? user;
  var decodedToken;
  var decodedTokenId; //used to know that you signed in and also sent with getData like apiKey
  signIn() async {
    try {
      emit(SignInLoadingState());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKeys.signInUserName: signInUserName.text,
          ApiKeys.signInPassword: signInPassword.text,
        },
        isFormData: false,
      );
      user = SignInModel.fromJson(response);
      decodedToken = JwtDecoder.decode(user!.token);
      decodedTokenId = decodedToken['id'];
      SharedPreferencesHelper.saveSharedPrefData(
          key: 'token', value: decodedToken);
      SharedPreferencesHelper.saveSharedPrefData(
          key: 'token', value: decodedTokenId);
      emit(SignInSuccsessState());
    } on ServerExeptions catch (e) {
      emit(SignInErrorState(e.errorModel.errorMessage));
    }
  }

//----------------------------signUp data--------------
  static final registerFormKey = GlobalKey<FormState>();
  TextEditingController signUpUserName = TextEditingController();
  TextEditingController signUPEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  //----
  XFile? profilePic;
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePicState());
  }

  signUp() async {
    try {
      emit(SignUpLoadingState());
      final response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKeys.signUpUserName: signUpUserName.text,
          ApiKeys.signUpEmail: signUPEmail.text,
          ApiKeys.signUpPhone: signUpPhone.text,
          ApiKeys.signUpPassword: signUpPassword.text,
          //-------send location
          ApiKeys.location:
              '${currentLocation},${currentLatitude},${currentLngitude}',
          ApiKeys.profilePic: await uploadImageToApi(profilePic!),
        },
        isFormData: true,
      );
      final signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccsessState(signUpModel.message));
    } on ServerExeptions catch (e) {
      emit(SignUPErrorState(e.errorModel.errorMessage));
    }
  }

  //---------------test login------
  bool checkLoginValidData(var userName, var password) {
    if ('ali lotfy' == userName && '123' == password)
      return true;
    else
      return false;
  }

  //-----------------------------bottom nav bar-----
  int currentIndex = 0;

  changeBottomNavIndex(index) {
    currentIndex = index;
    emit(BottomNavBarchangeIndexState());
  }

  //---------------screens
  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  //-----------------------------------------------dashBoard-------
  bool selectedCategoryItem = false;
  int selectedCategoryItemIndex = 0;
  Future<void> changeColorForItem(index) async {
    selectedCategoryItemIndex = index;
    emit(ChangeItemColorState());
  }

  //--------categries------------********
  List<String> categoryTitles = [
    'Coffie',
    'Desserts',
    'BreakFast',
    'FreashJuice ',
    'croissant'
  ];
  List<String> categoryImages = [
    'assets/images/coffie/1.jpg',
    'assets/images/desserts/2.jpg',
    'assets/images/breakfast/3.jpg',
    'assets/images/freashJuice/1.jpg',
    'assets/images/coroissant/1.jpg',
  ];
//-- List of grid items data ---------

  List<GridModelProuduct> coffieProuducts = [
    GridModelProuduct(1, 'Coffie', 'assets/images/coffie/1.jpg', 'coffie', 11),
    GridModelProuduct(1, 'Coffie', 'assets/images/coffie/2.jpg', 'coffie', 11),
    GridModelProuduct(1, 'Coffie', 'assets/images/coffie/3.jpg', 'coffie', 11),
    GridModelProuduct(1, 'Coffie', 'assets/images/coffie/4.jpg', 'coffie', 11),
    GridModelProuduct(6, 'Coffie', 'assets/images/coffie/5.jpg', 'coffie', 15),
    GridModelProuduct(1, 'Coffie', 'assets/images/coffie/6.jpg', 'coffie', 11),
  ];
  //------desert------
  List<GridModelProuduct> desertProuducts = [
    GridModelProuduct(
        1, 'Desert', 'assets/images/desserts/1.jpg', 'desert', 11),
    GridModelProuduct(
        1, 'Desert', 'assets/images/desserts/2.jpg', 'desert', 11),
    GridModelProuduct(
        1, 'Desert', 'assets/images/desserts/3.jpg', 'desert', 11),
    GridModelProuduct(
        1, 'Desert', 'assets/images/desserts/4.jpg', 'desert', 11),
    GridModelProuduct(
        6, 'Desert', 'assets/images/desserts/5.jpg', 'desert', 15),
    GridModelProuduct(
        1, 'Desert', 'assets/images/desserts/6.jpg', 'desert', 11),
  ];
//------breakFast-----------
  List<GridModelProuduct> breakFastProuducts = [
    GridModelProuduct(
        1, 'BreakFast', 'assets/images/breakfast/1.jpg', 'BreakFast', 11),
    GridModelProuduct(
        2, 'BreakFast', 'assets/images/breakfast/2.jpg', 'BreakFast', 11),
    GridModelProuduct(
        3, 'BreakFast', 'assets/images/breakfast/3.jpg', 'BreakFast', 11),
    GridModelProuduct(
        4, 'BreakFast', 'assets/images/breakfast/4.jpg', 'BreakFast', 11),
    GridModelProuduct(
        5, 'BreakFast', 'assets/images/breakfast/5.jpg', 'BreakFast', 15),
    GridModelProuduct(
        6, 'BreakFast', 'assets/images/breakfast/6.jpg', 'BreakFast', 11),
  ];

//------FrashJuice -----------
  List<GridModelProuduct> frashJuiceProuducts = [
    GridModelProuduct(
        1, 'frashJuice', 'assets/images/freashJuice/1.jpg', 'frashJuice', 11),
    GridModelProuduct(
        2, 'frashJuice', 'assets/images/freashJuice/2.jpg', 'frashJuice', 11),
    GridModelProuduct(
        3, 'frashJuice', 'assets/images/freashJuice/3.jpg', 'frashJuice', 11),
    GridModelProuduct(
        4, 'frashJuice', 'assets/images/freashJuice/4.jpg', 'frashJuice', 11),
    GridModelProuduct(
        5, 'frashJuice', 'assets/images/freashJuice/5.jpg', 'frashJuice', 15),
    GridModelProuduct(
        6, 'frashJuice', 'assets/images/freashJuice/6.jpg', 'frashJuice', 11),
  ];
//--------croissant---------------------------------
//------FrashJuice -----------
  List<GridModelProuduct> coroissantProuducts = [
    GridModelProuduct(
        1, 'coroissant', 'assets/images/coroissant/1.jpg', 'coroissant', 11),
    GridModelProuduct(
        2, 'frashJuice', 'assets/images/coroissant/2.jpg', 'frashJuice', 11),
    GridModelProuduct(
        3, 'coroissant', 'assets/images/coroissant/3.jpg', 'coroissant', 11),
    GridModelProuduct(
        4, 'coroissant', 'assets/images/coroissant/4.jpg', 'coroissant', 11),
    GridModelProuduct(
        5, 'coroissant', 'assets/images/coroissant/5.jpg', 'coroissant', 15),
    GridModelProuduct(
        6, 'coroissant', 'assets/images/coroissant/6.jpg', 'coroissant', 11),
  ];

//-------------------------------------------------------get currnt Location on map press
  String? currentLocation = 'Egypt';
  double currentLatitude = 30.033333;
  double currentLngitude = 31.233334;
  getCurrentLocation(double lat, double lng, Location) {
    currentLocation = Location;
    currentLatitude = lat;
    currentLngitude = lng;
    emit(GetCurrentLocationState());
  }

  //---------selected drink details--------
  //drink size--
  List<String> drinkSize = [
    'Small',
    'Medium',
    'Large',
  ];
  int currentDrinkSize = -1;
  String selectedDrinkSize = 'Small';
  changeDrinkSize(int index, String selectedDrinkSize) {
    currentDrinkSize = index;
    emit(ChangeDrinkSizeState());
    print(selectedDrinkSize); //print size selected
    return selectedDrinkSize;
  }

  //add top increment decrement---------
  int addCarmelToDrink = 0;
  int addBananaToDrink = 0;
  int addChoclateToDrink = 0;
  int addStroberryToDrink = 0;
  incrementSweetsOverDrink(String SweetType) {
    switch (SweetType) {
      case 'Carmel':
        addCarmelToDrink++;
        break;
      case 'Banana':
        addBananaToDrink++;
        break;
      case 'Choclate':
        addChoclateToDrink++;
        break;
      case 'Strowberry':
        addStroberryToDrink++;
        break;
    }

    emit(IncrementSweetsOverDrink());
  }

  decrementSweetsOverDrink(String SweetType) {
    switch (SweetType) {
      case 'Carmel':
        addCarmelToDrink--;
        break;
      case 'Banana':
        addBananaToDrink--;
        break;
      case 'Choclate':
        addChoclateToDrink--;
        break;
      case 'Strowberry':
        addStroberryToDrink--;
        break;
    }
    emit(DecrementSweetsOverDrink());
  }

  //---determine which sweet will increment or decrement------
  choiceSweetType(String sweetType) {
    switch (sweetType) {
      case 'Carmel':
        return addCarmelToDrink;
      case 'Banana':
        return addBananaToDrink;

      case 'Choclate':
        return addChoclateToDrink;
      case 'Strowberry':
        return addStroberryToDrink;
    }
    emit(ChoiceSweetTypeState());
  }

  //--------------favorite--
  List<Widget> favorateList = [];
  void removeFavoriteListItem(int index) {
    favorateList.removeAt(index);

    emit(RemoveFavoriteItemState()); // Notify the UI
  }

  int favorGridIndex = 0;
  changeHeartFavorColor(index) {
    // to change heart favor color
    favorGridIndex = index;
    emit(ChangeFavorHeartColorState());
  }

  //--------------cart-----

  List<Widget> cartList = [];

//total price---
  double TotalProductsPrice = 0.0;
  calcTotalPrice(double newAddPrice) {
    TotalProductsPrice += newAddPrice;
    emit(calculateTotalPriceState());
  }

  removeCartListItem(int index, double price) {
    if(index<=cartList.length){
    cartList.removeAt(index);
    TotalProductsPrice = TotalProductsPrice-price;
    }
        emit(RemoveCartItemState());
    
  }
}
