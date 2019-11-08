import "package:flutter/material.dart";

import '../../../../model/widget.dart';
import 'Radio/index.dart' as Radio;
import 'RadioListTile/index.dart' as RadioTile;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Radio',
    routerName: Radio.Demo.routeName,
    buildRouter: (BuildContext context) => Radio.Demo(),
  ),
  WidgetPoint(
    name: 'RadioListTile',
    routerName: RadioTile.Demo.routeName,
    buildRouter: (BuildContext context) => RadioTile.Demo(),
  ),
];
