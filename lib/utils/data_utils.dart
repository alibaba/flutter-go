import 'dart:async' show Future;

import 'package:fluro/fluro.dart';
import 'package:flutter_go/model/collection.dart';
import 'package:flutter_go/model/version.dart';
import 'package:flutter_go/model/widget.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_go/model/responseData.dart';

import './net_utils.dart';
import '../model/user_info.dart';
import 'package:flutter_go/api/api.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/routers/routers.dart';

class DataUtils {
  // 登陆获取用户信息
  static Future doLogin(Map<String, String> params) async {
    var response = await NetUtils.post(Api.DO_LOGIN, params);
    try {
      UserInformation userInfo = UserInformation.fromJson(response['data']);
      return userInfo;
    } catch (err) {
      return response['message'];
    }
  }

  // 获取用户信息
  static Future<UserInformation> getUserInfo(Map<String, String> params) async {
    var response = await NetUtils.get(Api.GET_USER_INFO, params);
    try {
      UserInformation userInfo = UserInformation.fromJson(response['data']);
      return userInfo;
    } catch (err) {
      return response['message'];
    }
  }

  // 验证登陆
  static Future checkLogin() async {
    var response = await NetUtils.get(Api.CHECK_LOGIN);
    print('response: $response');
    try {
      if (response['success']) {
        print('${response['success']}   ${response['data']}  response[succes]');
        UserInformation userInfo = UserInformation.fromJson(response['data']);
        print('${response['data']} $userInfo');
        return userInfo;
      } else {
        return response['success'];
      }
    } catch (err) {
      return response['message'];
    }
  }

  // 一键反馈
  static Future feedback(Map<String, String> params, context) async {
    var response = await NetUtils.post(Api.FEEDBACK, params);
    // print(response);
    if (response['status'] == 401 && response['message'] == '请先登录') {
      Application.router.navigateTo(context, '${Routes.loginPage}',
          transition: TransitionType.nativeModal);
    }
    return response;
  }

  //设置主题颜色
  static Future<bool> setThemeColor(int color, context) async {
    var response =
        await NetUtils.post(Api.SET_THEMECOLOR, {'color': color.toString()});
    if (response['status'] == 401 && response['message'] == '请先登录') {
      Application.router.navigateTo(context, '${Routes.loginPage}',
          transition: TransitionType.nativeModal);
    }
    return response['success'];
  }

  //获取主题颜色
  static Future<String> getThemeColor() async {
    var response = await NetUtils.get(Api.GET_THEMECOLOR);
    return response['success'];
  }

  // 退出登陆
  static Future<bool> logout() async {
    var response = await NetUtils.get(Api.LOGOUT);
    print('退出登陆 $response');
    return response['success'];
  }

  // 检查版本
  static Future<bool> checkVersion(Map<String, String> params) async {
    var response = await NetUtils.get(Api.VERSION, params);
    Version version = Version.formJson(response);
    var currVersion = version.data.version;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var localVersion = packageInfo.version;
    //相同=0、大于=1、小于=-1
    //    localVersion = '0.0.2';
    //    currVersion = '1.0.6';
    if (currVersion.compareTo(localVersion) == 1) {
      return true;
    } else {
      return false;
    }
  }

  /// 获取widget列表处的树型数据
  static Future<List> getWidgetTreeList() async {
    try {
      var response = await NetUtils.get(Api.GET_WIDGET_TREE);
      print('组件树：$response');
      if (response != null && response['success']) {
        return response['data'];
      } else {
        return [];
      }
    } catch (error) {
      print('获取组件树 error $error');
    }
  }

  // 校验是否收藏
  static Future<bool> checkCollected(Map<String, String> params) async {
    print('url 地址：${Api.CHECK_COLLECTED} $params');
    try {
      var response = await NetUtils.post(Api.CHECK_COLLECTED, params);
      return response != null && response['hasCollected'];
    } catch (error) {
      print('校验收藏 error $error');
    }
  }

  // 添加收藏
  static Future addCollected(Map<String, String> params, context) async {
    var response = await NetUtils.post(Api.ADD_COLLECTION, params);
    if (response['status'] == 401 && response['message'] == '请先登录') {
      Application.router.navigateTo(context, '${Routes.loginPage}',
          transition: TransitionType.nativeModal);
    }
    return response != null && response['success'];
  }

  // 移出收藏
  static Future removeCollected(Map<String, String> params, context) async {
    var response = await NetUtils.post(Api.REMOVE_COLLECTION, params);
    if (response['status'] == 401 && response['message'] == '请先登录') {
      Application.router.navigateTo(context, '${Routes.loginPage}',
          transition: TransitionType.nativeModal);
    }
    return response != null && response['success'];
  }

  // 获取全部收藏
  static Future getAllCollections(context) async {
    var response = await NetUtils.get(Api.GET_ALL_COLLECTION);
    List<Collection> responseList = [];
    if (response['status'] == 401 && response['message'] == '请先登录') {
      Application.router.navigateTo(context, '${Routes.loginPage}',
          transition: TransitionType.nativeModal);
    }
    if (response != null && response['success'] == true) {
      for (int i = 0; i < response['data'].length; i++) {
        Map<String, dynamic> tempCo = response['data'][i];
        responseList.add(Collection.fromJSON(
            {"name": tempCo['name'], "router": tempCo['url']}));
      }
      return responseList;
    } else {
      return [];
    }
  }

  // 搜索组件
  static Future searchWidget(String name) async {
    var response = await NetUtils.get(Api.SEARCH_WIDGET, {"name": name});
    List<WidgetPoint> list = [];
    if (response != null && response['success'] == true) {
      for (int i = 0; i < response['data'].length; i++) {
        var json = response['data'][i];
        String routerName;
        if (json['display'] == 'old') {
          routerName = json['path'];
        } else {
          routerName = json['pageId'];
        }
        Map<String, dynamic> tempMap = {
          "name": json['name'],
          "cnName": json['name'],
          "routerName": routerName,
          "catId": int.parse(json['parentId'])
        };
        list.add(WidgetPoint.fromJSON(tempMap));
      }
      return list;
    } else {
      return [];
    }
  }
}
