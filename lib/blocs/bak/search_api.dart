/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 3:20 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget: FlatButton 的示例
 */
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import './search_result.dart';
import 'package:html/parser.dart' show parse;

var dio = new Dio();
class Api {
  Future<List<SearchResult>> search(name) async {
    print('=========>>>');
    var response = await dio.get("https://www.so.com/s?ie=utf-8&q=$name");
//    var document = parse(response.data);
//    var app = document.querySelectorAll('.res-title a');
    List<SearchResult> res = [];
//    app.forEach((f) {
//      res.add(
//        SearchResult(
//          title: f.text,
//          source: f.attributes["data-url"] ?? f.attributes["href"],
//        ),
//      );
//    });
    return res;
  }
}

Api api = Api();