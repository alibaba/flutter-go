import 'package:sqflite/sqflite.dart';

class BaseModel{
    Database db;
    final String table = '';
    var query;
    BaseModel(this.db){
      query = db.query;
    }
}