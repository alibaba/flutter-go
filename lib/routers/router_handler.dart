import 'package:flutter_web/material.dart';
import 'fluro/fluro.dart';

import 'package:flutter_go/components/category.dart' show CategoryHome;
import '../widgets/404.dart' show WidgetNotFound;
import 'package:flutter_go/components/full_screen_code_dialog.dart';
//import 'package:flutter_go/views/web_page/web_view_page.dart';
import 'package:flutter_go/home.dart' show Home;

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Home();
  },
);
//
var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = params["type"]?.first;
    return new CategoryHome(name);
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String path = params['filePath']?.first;
    return new FullScreenCodeDialog(
      filePath: path
    );
      return Text('fullScreenCodeDialog');
});

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  //return new WebViewPage(url, title);
  return Text('webViewPageHand');
});
