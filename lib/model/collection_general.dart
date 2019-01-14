/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/1/12
 * Time: 下午9:19
 * email: zhu.yan@alibaba-inc.com
 */
import 'dart:async';
import '../common/sql.dart';

abstract class CollectionInterface {
  String get key;
  String get values;
}

class CollectionGeneral implements CollectionInterface {
  String key;
  String values;

  CollectionGeneral({this.key, this.values});

  factory CollectionGeneral.fromJSON(Map json){
    return CollectionGeneral(key: json['name'],values: json['values']);
  }

  Object toMap() {
    return {'key': key, 'values': values};
  }
}

class CollectionControlModel {
  final String table = 'collectionGeneral';
  Sql sql;

  CollectionControlModel() {
    sql = Sql.setTable(table);
  }

  // 获取所有的收藏

  // 插入新收藏
  Future insert(CollectionGeneral collection) {
    var result =
        sql.insert({'key': collection.key, 'values': collection.values});
    return result;
  }

  // 获取全部的收藏
  Future<List<CollectionGeneral>> getAllCollection() async {
    List list = await sql.getByCondition();
    List<CollectionGeneral> resultList = [];
    list.forEach((item){
      print(item);
      resultList.add(CollectionGeneral.fromJSON(item));
    });
    return resultList;
  }

  // 通过收藏名获取router
  Future getRouterByName(String key) async {
    List list = await sql.getByCondition(conditions: {'key': key});
    return list;
  }

  // 删除
  Future deleteByName(String key) async{
    return await sql.delete(key,'key');
  }
}
