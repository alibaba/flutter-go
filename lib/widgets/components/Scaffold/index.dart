/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 14:53
 * email: sanfan.hx@alibaba-inc.com
 * target:  xxx
 */

import "package:flutter/material.dart";
import '../../../model/widget.dart';
import 'Scaffold/index.dart' as Scaffold;
import 'ScaffoldState/index.dart' as ScaffoldState;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Scaffold',
    routerName: Scaffold.Demo.routeName,
    buildRouter: (BuildContext context) => Scaffold.Demo(),
  ),
  WidgetPoint(
    name: 'ScaffoldState',
    routerName: ScaffoldState.Demo.routeName,
    buildRouter: (BuildContext context) => ScaffoldState.Demo(),
  ),
];
