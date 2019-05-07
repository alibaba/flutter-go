import "package:flutter/material.dart";

import '../../../model/widget.dart';
import 'MaterialPageRoute/index.dart' as MaterialPageRoute;
import 'MaterialAccentColor/index.dart' as MaterialAccentColor;
import 'MaterialApp/index.dart' as MaterialApp;
import 'MaterialButton/index.dart' as MaterialButton;
import 'MaterialColor/index.dart' as MaterialColor;
import 'MergeableMaterialItem/index.dart' as MergeableMaterialItem;


List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'MaterialPageRoute',
    routerName: MaterialPageRoute.Demo.routeName,
    buildRouter: (BuildContext context) => MaterialPageRoute.Demo(),
  ),
  WidgetPoint(
    name: 'MaterialApp',
    routerName: MaterialApp.Demo.routeName,
    buildRouter: (BuildContext context) => MaterialApp.Demo(),
  ),
  WidgetPoint(
    name: 'MaterialColor',
    routerName: MaterialColor.Demo.routeName,
    buildRouter: (BuildContext context) => MaterialColor.Demo(),
  ),
  WidgetPoint(
    name: 'MaterialButton',
    routerName: MaterialButton.Demo.routeName,
    buildRouter: (BuildContext context) => MaterialButton.Demo(),
  ),
  
WidgetPoint(
    name: 'MaterialAccentColor',
    routerName: MaterialAccentColor.Demo.routeName,
    buildRouter: (BuildContext context) => MaterialAccentColor.Demo(),
  ),
  WidgetPoint(
    name: 'MergeableMaterialItem',
    routerName: MergeableMaterialItem.Demo.routeName,
    buildRouter: (BuildContext context) => MergeableMaterialItem.Demo(),
  ),
  
];
