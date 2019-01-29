import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../views/category.dart';
import '../widgets/404.dart';

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
