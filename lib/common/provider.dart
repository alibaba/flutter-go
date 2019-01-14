import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;
//const createSql = {
//  'cat': """
//      CREATE TABLE "cat" (
//      `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
//      `name`	TEXT NOT NULL UNIQUE,
//      `depth`	INTEGER NOT NULL DEFAULT 1,
//      `parentId`	INTEGER NOT NULL,
//      `desc`	TEXT
//    );
//  """,
//  'collectio': """
//    CREATE TABLE collection (id INTEGER PRIMARY KEY NOT NULL UNIQUE, name TEXT NOT NULL, router TEXT);
//  """,
//  'widget': """
//    CREATE TABLE widget (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, name TEXT NOT NULL, cnName TEXT NOT NULL, image TEXT NOT NULL, doc TEXT, demo TEXT, catId INTEGER NOT NULL REFERENCES cat (id), owner TEXT);
//  """;
//};

class Provider {
  static Database db;

  // 获取数据库中所有的表
  Future<List> getTables() async {
    if (db == null) {
      return Future.value([]);
    }
    List tables = await db.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    List<String> targetList = [];
    tables.forEach((item)  {
      targetList.add(item['name']);
    });
    return targetList;
  }

  // 检查数据库中, 表是否完整, 在部份android中, 会出现表丢失的情况
  Future checkTableIsRight() async {
    List<String> expectTables = ['cat', 'widget', 'collection'];

    List<String> tables = await getTables();

    for(int i = 0; i < expectTables.length; i++) {
      if (!tables.contains(expectTables[i])) {
        return false;
      }
    }
   return true;

  }

  //初始化数据库

  Future init(bool isCreate) async {
    //Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'flutter.db');

    try {
      db = await openDatabase(path);
    } catch (e) {
      print("Error $e");
    }
    bool tableIsRight = await this.checkTableIsRight();

    if (!tableIsRight) {
      // 关闭上面打开的db，否则无法执行open
      db.close();
      // Delete the database
      await deleteDatabase(path);
      ByteData data = await rootBundle.load(join("assets", "app.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);

      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        print('db created version is $version');
      }, onOpen: (Database db) async {
        print('new db opened');
      });
    } else {
      print("Opening existing database");
    }
  }

}
