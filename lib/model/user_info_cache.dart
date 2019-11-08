/// @Author: 一凨
/// @Date: 2019-01-07 16:24:42
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-08 17:37:42

import 'dart:async';

import 'package:flutter_go/utils/sql.dart';

abstract class UserInfoInterface {
  String get username;
  String get password;
}

class UserInfo implements UserInfoInterface {
  String username;
  String password;

  UserInfo({this.username, this.password});

  factory UserInfo.fromJSON(Map json) {
    return UserInfo(username: json['username'], password: json['password']);
  }

  Object toMap() {
    return {'username': username, 'password': password};
  }
}

class UserInfoControlModel {
  final String table = 'userInfo';
  Sql sql;

  UserInfoControlModel() {
    sql = Sql.setTable(table);
  }

  // 获取所有的收藏

  // 插入新的缓存
  Future insert(UserInfo userInfo) {
    var result = sql
        .insert({'username': userInfo.username, 'password': userInfo.password});
    return result;
  }

  // 获取用户信息
  Future<List<UserInfo>> getAllInfo() async {
    List list = await sql.getByCondition();
    List<UserInfo> resultList = [];
    list.forEach((item) {
      print(item);
      resultList.add(UserInfo.fromJSON(item));
    });
    return resultList;
  }

  // 清空表中数据
  Future deleteAll() async {
    return await sql.deleteAll();
  }
}
