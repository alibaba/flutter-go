import "package:flutter/material.dart";

import '../../../../model/widget.dart';
import 'Checkbox/index.dart' as Checkbox;
import 'CheckboxListTile/index.dart' as CheckboxListTile;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Checkbox',
    routerName: Checkbox.Demo.routeName,
    buildRouter: (BuildContext context) => Checkbox.Demo(),
  ),
  WidgetPoint(
    name: 'CheckboxListTile',
    routerName: CheckboxListTile.Demo.routeName,
    buildRouter: (BuildContext context) => CheckboxListTile.Demo(),
  )
];
