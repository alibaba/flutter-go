/// Created with FlutterGo.
/// User: 一晟
/// Date: 2018/11/14
/// Time: 下午4:31
/// email: zhu.yan@alibaba-inc.com
/// target: Input 的示例
/// 对应文档地址:https://docs.flutter.io/flutter/material/RaisedButton-class.html

import '../../../../model/widget.dart';
import "package:flutter/material.dart";

import './TextField/index.dart' as TextField;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'TextField',
    routerName: TextField.Demo.routeName,
    buildRouter: (BuildContext context) => TextField.Demo(),
  ),
];
