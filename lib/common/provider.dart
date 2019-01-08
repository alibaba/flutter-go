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
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath,'flutter.db');
    print("path ${path}");

    if(db == null && isCreate){
      ByteData data = await rootBundle.load(join("assets", "app.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);

      db = await openDatabase(path,version: 2,onCreate : (Database db, int version) async{
        print('db created version is $version');
      },onOpen : (Database db) async{
        print('new db opened');
      });
    }else{
      print('Opening existing database');
    }
  }
}
