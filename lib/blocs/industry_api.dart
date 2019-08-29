//
// Created with Android Studio.
// User: 一晟
// Date: 2019/4/28
// Time: 3:20 PM
// email: zhu.yan@alibaba-inc.com
// tartget: FlatButton 的示例
//
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import './search_result.dart';

var dio = new Dio();
//class Api2 {
//  /// 关键字提示（起点）
//  Future<List<String>> suggestion(String query) async {
////    http.Response response = await http.get(
////        "https://www.qidian.com/ajax/Search/AutoComplete?siteid=1&query=$query");
//    var response = await dio.get("https://www.qidian.com/ajax/Search/AutoComplete?siteid=1&query=$query", data: {});
//    //var response = await dio.get("https://www.so.com/s?ie=utf-8&q=$query");
//    print('1=====>${query}');
//    print('2=====>${response.data}');
//    //var data = Suggestion.fromJson(json.decode(response.body));
//    //var data = Suggestion.fromJson(json.decode(response.data));
//    var data = Suggestion.fromJson(json.decode(response.data));
//    List<String> suggestion = [];
//    data.suggestions.forEach((k) {
//      //print('=====>${k.value}');
//      suggestion.add(k.value);
//    });
//
//    return Future.delayed(Duration(seconds:2), () {
//      return suggestion;
//    });
//    //return suggestion;
//  }
//}
class Api {
  /// 关键字提示（起点）
  Future<List<SearchResult>> suggestion(String query) async {
//    http.Response response = await http.get(
//        "https://www.qidian.com/ajax/Search/AutoComplete?siteid=1&query=$query");
    /// var response = await dio.get("https://www.qidian.com/ajax/Search/AutoComplete?siteid=1&query=$query", data: {});
    var response = await dio.get("https://www.so.com/s?ie=utf-8&q=$query flutter");
    var document = parse(response.data);
    var app = document.querySelectorAll('.res-title a');
    ///print('1=====>${query}');
    ///print('2=====>${response.data}');
    ////print('3=====>${app}');
    List<SearchResult> res = [];
    app.forEach((f) {
      ///print('f==>${f}');
      res.add(
        SearchResult(
          title: f.text,
          source: f.attributes["data-url"] ?? f.attributes["href"],
        ),
      );
    });

    return Future.delayed(Duration(seconds:2), () {
      return res;
    });
    //return suggestion;
  }
}

Api api = Api();