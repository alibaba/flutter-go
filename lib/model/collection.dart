/// @Author: 一凨 
/// @Date: 2019-01-07 16:24:42 
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-08 17:37:42

import 'dart:async';

import 'package:flutter_go/utils/sql.dart';

abstract class CollectionInterface {
  String get name;
  String get router;
}

class Collection implements CollectionInterface {
  String name;
  String router;

  Collection({this.name, this.router});

  factory Collection.fromJSON(Map json){
    return Collection(name: json['name'],router: json['router']);
  }

  Object toMap() {
    return {'name': name, 'router': router};
  }
}

class CollectionControlModel {
  final String table = 'collection';
  Sql sql;

  CollectionControlModel() {
    sql = Sql.setTable(table);
  }

  // 获取所有的收藏

  // 插入新收藏
  Future insert(Collection collection) {
    var result =
        sql.insert({'name': collection.name, 'router': collection.router});
    return result;
  }

  // 获取全部的收藏
  Future<List<Collection>> getAllCollection() async {
    List list = await sql.getByCondition();
    List<Collection> resultList = [];
    list.forEach((item){
      print('collection item =>> $item');
      resultList.add(Collection.fromJSON(item));
    });
    return resultList;
  }

  // 通过收藏名获取router
  Future getRouterByName(String name) async {
    List list = await sql.getByCondition(conditions: {'name': name});
    return list;
  }

  // 删除
  Future deleteByName(String name) async{
    return await sql.delete(name,'name');
  }
}
