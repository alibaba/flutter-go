import 'package:flutter/material.dart';
import '../../../../model/widget.dart';

import './crossAxis/index.dart' as crossAxis;
import './flipAxis/index.dart' as flipAxis;
import './mainAxis/index.dart' as mainAxis;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'crossAxis',
    routerName: crossAxis.Demo.routeName,
    buildRouter: (BuildContext context) => crossAxis.Demo(),
  ),
  WidgetPoint(
    name: 'flipAxis',
    routerName: flipAxis.Demo.routeName,
    buildRouter: (BuildContext context) => flipAxis.Demo(),
  ),
  WidgetPoint(
    name: 'mainAxis',
    routerName: mainAxis.Demo.routeName,
    buildRouter: (BuildContext context) => mainAxis.Demo(),
  ),
];
