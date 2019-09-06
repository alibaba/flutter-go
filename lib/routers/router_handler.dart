import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_go/components/category.dart';
import '../widgets/404.dart';
import 'package:flutter_go/components/full_screen_code_dialog.dart';
import 'package:flutter_go/views/web_page/web_view_page.dart';
import 'package:flutter_go/views/home.dart';
import 'package:flutter_go/views/login_page/login_page.dart';
import 'package:flutter_go/model/user_info.dart';
import 'package:flutter_go/views/collection_page/collection_page.dart';
import 'package:flutter_go/views/collection_page/collection_full_page.dart';
import 'package:flutter_go/views/standard_demo_page/index.dart';
import 'package:flutter_go/views/issuse_message_page/issuse_message_page.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AppPage(UserInformation(id: 0));
  },
);

var collectionFullHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    bool hasLogined = params['hasLogin']?.first == 'true';
    return CollectionFullPage(hasLogined: hasLogined);
  }
);

var collectionHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    bool hasLogined = params['hasLogin']?.first == 'true';
    return CollectionPage(hasLogined: hasLogined);
  }
);

var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String ids = params["ids"]?.first;

    return new CategoryHome(ids);
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new WidgetNotFound();
    });
var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    });

var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String path = params['filePath']?.first;
      return new FullScreenCodeDialog(
        filePath: path,
      );
    });


var githubCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String path = params['remotePath']?.first;
      return new FullScreenCodeDialog(
        remoteFilePath: path,
      );
    });

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});


var standardPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String id = params['id']?.first;
    return StandardView(id: id);
  }
);


var issuesMessageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return IssuesMessagePage();
    });
