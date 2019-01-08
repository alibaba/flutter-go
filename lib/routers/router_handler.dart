import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../views/category.dart';
import '../widgets/404.dart';

var categoryHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("params $params");
      String name = params["type"]?.first;
      print("type::: $name");

      return new CategoryHome(name);
    },
  );

var widgetNotFoundHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new WidgetNotFound();
  }
);