import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class Provider {
  static Database db;

  //初始化数据库
  // isCreate 用永远 copy 一个新的数据库
  Future init(bool isCreate) async {
    //Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'flutter.db');
    List<Map> list;
    // try {
    //   db = await openDatabase(path, readOnly: true);

    // } catch (e) {
    //   print("Error $e");
    // }

    if (db == null) {
      // Delete the database
      await deleteDatabase(path);

      ByteData data = await rootBundle.load(join("assets", "app.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);

      // db = await openDatabase(path, version: 2,
      //     onCreate: (Database db, int version) async {
      //   print('db created version is $version');
      // }, onOpen: (Database db) async {
      //   print('new db opened');
      // });
      db = await openDatabase(path, readOnly: true);
            list = await db
          .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
      print('$list 1234567891');
    } else {
      print("Opening existing database");
    }
  }
}
