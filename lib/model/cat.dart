
import 'dart:async';

//import 'package:flutter_go/utils/sql.dart';

/*
{"parentId":3}
[{"id":1, "name": element, "depth": 1, "parentId":0, "desc": 布局}, {"id":2, "name": components, "depth": 1, "parentId":0, "desc": 组件}, {"id":3, "name": themes, "depth": 1, "parentId":0, "desc": 主题}]
flutter: [{"id":4, "name": form, "depth": 2, "parentId":1, "desc": Form表单}, {"id":17, "name": Frame, "depth": 2, "parentId":1, "desc": desc}, {"id":18, "name": Media, "depth": 2, "parentId":1, "desc": Media(媒介)}]
flutter: [{"id":30, "name": Navigation, "depth": 2, "parentId":2, "desc": Navigation}, {"id":31, "name": List, "depth": 2, "parentId":2, "desc": List}, {"id":32, "name": Card, "depth": 2, "parentId":2, "desc": Card}, {"id":33, "name": Bar, "depth": 2, "parentId":2, "desc": Bar}, {"id":34, "name": Dialog, "depth": 2, "parentId":2, "desc": Dialog}, {"id":35, "name": Scaffold, "depth": 2, "parentId":2, "desc": Scaffold}, {"id":36, "name": Grid, "depth": 2, "parentId":2, "desc": 网格布局}, {"id":37, "name": Scroll, "depth": 2, "parentId":2, "desc": 滚动视图}, {"id":38, "name": Tab, "depth": 2, "parentId":2, "desc": Tab}, {"id":39, "name": Menu, "depth": 2, "parentId":2, "desc": Menu}, {"id":40, "name": Pick, "depth": 2, "parentId":2, "desc": Pick}, {"id":41, "name": Chip, "depth": 2, "parentId":2, "desc": Chip}, {"id":42, "name": Panel, "depth": 2, "parentId":2, "desc": Panel}, {"id":43, "name": Progress, "depth": 2, "parentId":2, "desc": Progress}]
flutter: [{"id":44, "name": Material, "depth": 2, "parentId":3, "desc": Material}, {"id":45, "name": Cupertino, "depth": 2, "parentId":3, "desc": Cupertino}]
 */

import 'mockData.dart';

abstract class CatInterface{
    int get id;
    //类目名称
    String get name;
    //描述
    String get desc;
    //第几级类目，默认 1
    int get depth;
    //父类目id，没有为 0
    int get parentId;
}

class Cat implements CatInterface {
  int id;
  String name;
  String desc;
  int depth;
  int parentId;

  Cat({this.id, this.name, this.desc, this.depth, this.parentId});

  Cat.fromJSON(Map json)
      : id = json['id'],
        name = json['name'],
        desc = json['desc'],
        depth = json['depth'],
        parentId = json['parentId'];

  String toString() {
    return '(Cat $name)';
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      '"depth"': "depth",
      'parentId': parentId
    };
  }
  Map toSqlCondition() {
    Map _map = this.toMap();
    Map condition = {};
    _map.forEach((k, value) {

      if (value != null) {

        condition[k] = value;
      }
    });

    if (condition.isEmpty) {
      return {};
    }

    return condition;
  }
}


class CatControlModel{
  final String table = 'cat';
  ///Sql sql;
  CatControlModel() {
    ///sql = Sql.setTable(table);
  }

  /// 获取一级类目
  Future<List> mainList() async{
    //List listJson =  await sql.getByCondition(conditions: {'parentId': 0});
    List listJson =  getCatMock({'parentId': 0});
    List<Cat> cats = listJson.map((json) {
        return new Cat.fromJSON(json);
    }).toList();
    return cats;
  }

  // 获取Cat不同深度与parent的列表
  Future<List<Cat>> getList([Cat cat]) async{
    if (cat == null) {
      cat = new Cat(depth: 1, parentId:0);
    }
    print("cat in getList ${cat.toMap()}");
    //List listJson =  await sql.getByCondition(conditions: cat.toSqlCondition());
    List listJson =  getCatMock(cat.toSqlCondition());
    List cats = listJson.map((json) {
      return new Cat.fromJSON(json);
    }).toList();
    return cats.length > 0 ? cats : List<Cat>();
  }

  // 通过name获取Cat对象信息
  Future<Cat> getCatByName(String name) async {
    //List json = await sql.getByCondition(conditions: {'name': name});
    List json = getCatMock({'name': name});
    if (json.isEmpty) {
      return null;
    }
    print('getCatByName:::${new Cat.fromJSON(json.first)},${json.isEmpty},${name}');
    return new Cat.fromJSON(json.first);
  }

}
