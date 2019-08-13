import 'dart:async';
//import 'dart:io';
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:jsonp/jsonp.dart' as jsonp;

import 'dart:html' as html;

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json',
};

//var dio = new Dio(BaseOptions(connectTimeout: 30000,headers: optHeader));

class NetUtils {
  static Future get(String url, [Map<String, dynamic> params]) async {
    var response;
    // 设置代理 便于本地 charles 抓包
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 30.10.26.193:8888";
    //   };
    // };

    // Directory documentsDir = await getApplicationDocumentsDirectory();
    // String documentsPath = documentsDir.path;
    // var dir = new Directory("$documentsPath/cookies");
    // await dir.create();
    // // print('documentPath:${dir.path}');
    // dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    // if (params != null) {
    //   response = await dio.get(url, queryParameters: params);
    // } else {
    //   response = await dio.get(url);
    // }
    var newParams = new Map<String, String>();
    var paramString = '';
    params.forEach((k,v) =>{
      newParams[k] = v.toString(),
      paramString += '&${k.toString()}=${v.toString()}'
    }); 

    print('请求url:${url}${paramString}');
    response = await http.get('${url}${paramString}');

    ////response = await jsonp.fetch(uri:'https://timeline-merger-ms.juejin.im/v1/get_tag_entry'+'?callback=?');
    ///var response2 = html.HttpRequest.getString('https://api.github.com/');

    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //print(convert.jsonDecode(response.body)['d']);
      return jsonResponse;
  } else {
    print("Request failed with status: ${response.statusCode}.");
    return [];
  }
    
  }

  static Future post(String url, Map<String, dynamic> params) async {
    //var response = await dio.post(url, data: params);
    var response = await http.post(url);
    //return response.data;
    return null;
  }
}


