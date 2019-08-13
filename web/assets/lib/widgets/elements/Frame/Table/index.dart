import 'package:flutter_web/material.dart';

import '../../../../model/widget.dart';
import './Table/index.dart' as Table;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Table',
    routerName: Table.Demo.routeName,
    buildRouter: (BuildContext context) => Table.Demo(),
  ),
];
