import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go/components/category.dart';
import 'package:flutter_go/components/full_screen_code_dialog.dart';
import 'package:flutter_go/model/user_info.dart';
import 'package:flutter_go/views/collection_page/collection_full_page.dart';
import 'package:flutter_go/views/collection_page/collection_page.dart';
import 'package:flutter_go/views/home.dart';
import 'package:flutter_go/views/issuse_message_page/issuse_message_page.dart';
import 'package:flutter_go/views/login_page/login_page.dart';
import 'package:flutter_go/views/standard_demo_page/index.dart';
import 'package:flutter_go/views/web_page/web_view_page.dart';

import '../widgets/404.dart';

// app的首页
var homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return AppPage(UserInformation(id: 0));
  },
);

var collectionFullHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  bool hasLogined = params['hasLogin']?.first == 'true';
  return CollectionFullPage(hasLogined: hasLogined);
});

var collectionHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  bool hasLogined = params['hasLogin']?.first == 'true';
  return CollectionPage(hasLogined: hasLogined);
});

var categoryHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String ids = params["ids"]?.first;

    return CategoryHome(ids);
  },
);

var widgetNotFoundHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WidgetNotFound();
});
var loginPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var fullScreenCodeDialog = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String path = params['filePath']?.first;
  return FullScreenCodeDialog(
    filePath: path,
  );
});

var githubCodeDialog = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String path = params['remotePath']?.first;
  return FullScreenCodeDialog(
    remoteFilePath: path,
  );
});

var webViewPageHand = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return WebViewPage(url, title);
});

var standardPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String id = params['id']?.first;
  return StandardView(id: id);
});

var issuesMessageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IssuesMessagePage();
});
