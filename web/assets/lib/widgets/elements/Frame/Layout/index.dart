import 'package:flutter_web/material.dart';

import '../../../../model/widget.dart';
import 'Row/index.dart' as Row;
import 'Column/index.dart' as Column;
import 'Container/index.dart' as Container;
import 'Center/index.dart' as Center;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Row',
    routerName: Row.Demo.routeName,
    buildRouter: (BuildContext context) => Row.Demo(),
  ),
  WidgetPoint(
    name: 'Column',
    routerName: Column.Demo.routeName,
    buildRouter: (BuildContext context) => Column.Demo(),
  ),
  WidgetPoint(
    name: 'Container',
    routerName: Container.Demo.routeName,
    buildRouter: (BuildContext context) => Container.Demo(),
  ),
   WidgetPoint(
    name: 'Center',
    routerName: Center.Demo.routeName,
    buildRouter: (BuildContext context) => Center.Demo(),
  ),
];
