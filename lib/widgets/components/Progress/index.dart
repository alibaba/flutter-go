import "package:flutter/material.dart";
import '../../../model/widget.dart';

import 'LinearProgressIndicator/index.dart' as LinearProgressIndicator;
import 'CircularProgressIndicator/index.dart' as CircularProgressIndicator;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'LinearProgressIndicator',
    routerName: LinearProgressIndicator.Demo.routeName,
    buildRouter: (BuildContext context) => LinearProgressIndicator.Demo(),
  ),
  WidgetPoint(
    name: 'CircularProgressIndicator',
    routerName: CircularProgressIndicator.Demo.routeName,
    buildRouter: (BuildContext context) => CircularProgressIndicator.Demo(),
  ),
];
