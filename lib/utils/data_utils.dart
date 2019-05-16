import 'dart:async' show Future;

import 'package:flutter_go/model/version.dart';
import 'package:package_info/package_info.dart';

import './net_utils.dart';
import '../model/user_info.dart';
import 'package:flutter_go/api/api.dart';

class DataUtils {
  // 登陆获取用户信息
  static Future<UserInfo> doLogin(Map<String, String> params) async {
    var response = await NetUtils.post(Api.DO_LOGIN, params);
    UserInfo userInfo = UserInfo.fromJson(response['data']);
    return userInfo;
  }

  // 验证登陆

  static Future<bool> checkLogin() async {
    var response = await NetUtils.get(Api.CHECK_LOGIN);
    print('验证登陆：$response');
    return response['success'];
  }

  // 退出登陆
  static Future<bool> logout() async {
    var response = await NetUtils.get(Api.LOGOUT);
    print('退出登陆 $response');
    return response['success'];
  }

  /**
   * {"status":200,"data":{"version":"0.0.2","name":"FlutterGo"},"success":true}
   */
  // 检查版本
  static Future<bool> checkVersion(Map<String, String> params) async {
    var response = await NetUtils.get(Api.VERSION, params);
    Version version = Version.formJson(response);
    var currVersion = version.data.version;
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      var localVersion = packageInfo.version;
      //0:相同、1:大于、-1:小于
      //currVersion: 1.0.6 // localVersion：0.0.2 //packbuildNumber  1 true
      //currVersion: 1.0.6 // localVersion：2.0.2 //packbuildNumber  -1 false
      if (currVersion.compareTo(localVersion) == 1) {
        print('currVersion: true');
        return true;
      } else {
        print('currVersion: flase');
        return false;
      }
    });
  }
}
