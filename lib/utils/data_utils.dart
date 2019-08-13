import 'dart:async' show Future;

import './net_utils.dart';
import '../model/user_info.dart';
import 'package:flutter_go/api/api.dart';


class DataUtils{
  // 登陆获取用户信息
  static Future<UserInfo> doLogin(Map<String,String> params) async{
    var response = await NetUtils.post(Api.DO_LOGIN, params);
    UserInfo userInfo = UserInfo.fromJson(response['data']);
    return userInfo;
  }

  // 验证登陆

  static Future<bool> checkLogin() async{
    var response = await NetUtils.get(Api.CHECK_LOGIN);
    print('验证登陆：$response');
    return response['success'];
  }

  // 退出登陆
    static Future<bool> logout() async{
    var response = await NetUtils.get(Api.LOGOUT);
    print('退出登陆 $response');
    return response['success'];
  }
}