/// Created with Android Studio.
/// User: 一晟
/// Date: 2018/12/27
/// Time: 下午2:50
/// email: zhu.yan@alibaba-inc.com
/// target: List 的示例

import "package:flutter/material.dart";

import '../../../model/widget.dart';
import 'ListBody/index.dart' as ListBody;
import 'ListView/index.dart' as ListView;
import 'AnimatedList/index.dart' as AnimatedList;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'ListBody',
    routerName: ListBody.Demo.routeName,
    buildRouter: (BuildContext context) => ListBody.Demo(),
  ),
  WidgetPoint(
    name: 'ListView',
    routerName: ListView.Demo.routeName,
    buildRouter: (BuildContext context) => ListView.Demo(),
  ),
  WidgetPoint(
    name: 'AnimatedList',
    routerName: AnimatedList.Demo.routeName,
    buildRouter: (BuildContext context) => AnimatedList.Demo(),
  )
];
