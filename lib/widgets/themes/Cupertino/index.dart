import "package:flutter/material.dart";
import '../../../model/widget.dart';

import 'CupertinoApp/index.dart' as CupertinoApp;
import 'CupertinoButton/index.dart' as CupertinoButton;
import 'CupertinoColors/index.dart' as CupertinoColors;
import 'CupertinoIcons/index.dart' as CupertinoIcons;


List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'CupertinoIcons',
    routerName: CupertinoIcons.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoIcons.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoColors',
    routerName: CupertinoColors.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoColors.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoButton',
    routerName: CupertinoButton.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoButton.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoApp',
    routerName: CupertinoApp.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoApp.Demo(),
  ),
];
