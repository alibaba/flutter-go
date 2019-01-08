import '../../../../model/widget.dart';
import "package:flutter/material.dart";

import 'FlatButton/index.dart' as FlatButton;
import 'RaisedButton/index.dart' as RaisedButton;


List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'FlatButton',
    routerName: FlatButton.Demo.routeName,
    buildRouter: (BuildContext context) => FlatButton.Demo(),
  ),
  WidgetPoint(
    name: 'RaisedButton',
    routerName: RaisedButton.Demo.routeName,
    buildRouter: (BuildContext context) => RaisedButton.Demo(),
  ),
];