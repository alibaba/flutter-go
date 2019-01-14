import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../views/category.dart';
import '../widgets/404.dart';
import '../common/full_screen_code_dialog.dart';

var categoryHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String name = params["type"]?.first;

      return new CategoryHome(name);
    },
  );

var widgetNotFoundHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new WidgetNotFound();
  }
);

var fullScreenCodeDialog = new Handler(
  handlerFunc: (BuildContext context,Map<String, List<String>> params){
    String path = params['filePath']?.first;
    return new FullScreenCodeDialog(filePath: path,);
  }
);
