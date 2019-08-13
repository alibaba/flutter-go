/// @Author: 一凨
/// @Date: 2019-01-07 16:24:42
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-08 17:37:42

import 'dart:async';

import 'package:idb_shim/idb.dart';
//import 'package:idb_shim/idb_io.dart';
import 'package:idb_shim/idb_browser.dart';

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
  Database _db = null;
  IdbFactory idbFactory = getIdbFactory();

  CollectionControlModel() {
    creatObject();
  }

  Future creatObject() async {
    if(_db == null){
      _db = await idbFactory.open("my_records.db", version: 1,
          onUpgradeNeeded: (VersionChangeEvent event) {
            Database db = event.database;
            if(!db.objectStoreNames.contains(table)){
              var store = db.createObjectStore(
                  table, keyPath: 'name', autoIncrement: true);
              //store.createIndex('Name', 'name', unique:true);
            }
          }
      );
      return _db;
    }else {
      return _db;
    }

//     insert(Collection(name: 'widget.title1', router: 'router'));
//     insert(Collection(name: 'widget.title2', router: 'router'));
//     deleteByName('widget.title1');
//     getAllCollection();
  }

  // 获取所有的收藏

  // 插入新收藏
  Future insert(Collection collection) async {
    var txn = _db.transaction(table, idbModeReadWrite);
    var store = txn.objectStore(table);
    var key = await store.put({'name': collection.name, 'router': collection.router});
    final value = await store.getObject(key) as Map;
    await txn.completed;
    return value;
  }

  // 获取全部的收藏
  Future<List<Collection>> getAllCollection() async {
    var db = await creatObject();
    var txn = db.transaction(table, idbModeReadOnly);
    var store = txn.objectStore(table);

    List<Collection> resultList = [];
    store.openCursor().forEach((item){
      resultList.add(Collection.fromJSON(item.value as Map));
      item.next();
    });
    await txn.completed;
    return resultList;

  }

  // 通过收藏名获取router
  Future getRouterByName(String name) async {
    var db = await creatObject();
    var txn = db.transaction(table, idbModeReadOnly);
    var store = txn.objectStore(table);
    var value = await store.getObject(name) as Map;
    List<Map> resultList = [];
    if(value != null){
      resultList.add(value);
    }
    await txn.completed;
    return resultList;
  }

  // 删除
  Future deleteByName(String name) async{
    var txn = _db.transaction(table, idbModeReadWrite);
    var store = txn.objectStore(table);
    var value = await store.getObject(name) as Map;
    await store.delete(name);
    await txn.completed;
    return value != null ? 1 : 0;
  }
}
