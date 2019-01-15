import "package:flutter/material.dart";
import '../../../model/widget.dart';
import './CupertinoScrollbar/index.dart' as CupertinoScrollbar;
List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'CupertinoScrollbar',
    routerName: CupertinoScrollbar.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoScrollbar.Demo(),
  )
];
