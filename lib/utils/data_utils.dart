import 'dart:async' show Future;

import './net_utils.dart';
import '../model/user_info.dart';
import 'package:flutter_go/api/api.dart';


class DataUtils{
  // 登陆获取用户信息
  static Future<UserInfo> doLogin(Map<String,String> params) async{
    var response = await NetUtils.post(Api.DO_LOGIN, params);
    print('url:${Api.DO_LOGIN}  $response');
    UserInfo userInfo = UserInfo.fromJson(response['data']);
    return userInfo;
  }
}