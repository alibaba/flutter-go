import 'dart:async';

import 'package:dio/dio.dart';


var dio = new Dio();

class NetUtils {
  
  static Future get(String url,{Map<String,dynamic> params}) async{
     var response = await dio.get(url, data: params);
    return  response.data;
  }

  static Future post(String url,Map<String,dynamic> params) async{
    var response = await dio.post(url, data: params);
    return response.data;
  }
}