import 'dart:async';

import 'package:sqflite/sqflite.dart';

import './provider.dart';

class BaseModel{
  Database db;
  final String table = '';
  var query;
  BaseModel(this.db){
    query = db.query;
  }
}

class Sql extends BaseModel {
  final String tableName;
  Sql.setTable(String name)
      : tableName = name,
        super(Provider.db);

  // sdf
  Future<List> get() async{
    return await this.query(tableName);
  }
  String getTableName () {
    return tableName;
  }

  Future<int> delete(String value,String key) async{
    return await this.db.delete(tableName,where:'$key = ?',whereArgs:[value]);
  }

  Future<List> getByCondition({Map<dynamic, dynamic> conditions}) async {
    if (conditions == null || conditions.isEmpty) {
      return this.get();
    }
    String stringConditions = '';

    int index = 0;
    conditions.forEach((key, value) {
      if (value == null) {
        return ;
      }
      if (value.runtimeType == String) {
        stringConditions = '$stringConditions $key = "$value"';
      }
      if (value.runtimeType == int) {
        stringConditions = '$stringConditions $key = $value';
      }

      if (index >= 0 && index < conditions.length -1) {
        stringConditions = '$stringConditions and';
      }
      index++;
    });
    // print("this is string condition for sql > $stringConditions");
    return await this.query(tableName, where: stringConditions);
  }
  Future<Map<String, dynamic>> insert(Map<String, dynamic> json) async {
    var id = await this.db.insert(tableName, json);
    json['id'] = id;
    return json;
  }
  ///
  /// 搜索
  /// @param Object condition
  /// @mods [And, Or] default is Or
  /// search({'name': "hanxu', 'id': 1};
  ///
  Future<List> search({Map<String, dynamic> conditions, String mods = 'Or'}) async {
    if (conditions == null || conditions.isEmpty) {
      return this.get();
    }
    String stringConditions = '';
    int index = 0;
    conditions.forEach((key, value) {
      if (value == null) {
        return ;
      }

      if (value.runtimeType == String) {
        stringConditions = '$stringConditions $key like "%$value%"';
      }
      if (value.runtimeType == int) {
        stringConditions = '$stringConditions $key = "%$value%"';
      }

      if (index >= 0 && index < conditions.length -1) {
        stringConditions = '$stringConditions $mods';
      }
      index++;
    });

    return await this.query(tableName, where: stringConditions);
  }
}