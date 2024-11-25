// ignore_for_file: empty_constructor_bodies

import 'package:coffi_shop/core/api/endPoints.dart';

class ErrorModel {
  //--------this parameters depends on what parameters is returned by backEnd---
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    //------- ststus and ErrorMessage  ---must equal in api parameters
    return ErrorModel(status: jsonData[ApiKey.statusCode], errorMessage: jsonData[ApiKey.errorMessage]);
  }
}
