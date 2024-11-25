// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //----path header here
    options.headers ['']='';
    super.onRequest(options, handler);
  }
}
