/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 19:40
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import "package:flutter/material.dart";
import '../../../model/widget.dart';
import 'GridTile/index.dart' as GridTile;
import 'GridView/index.dart' as GridView;
import 'GridTileBar/index.dart' as GridTileBar;
List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'GridTile',
    routerName: GridTile.Demo.routeName,
    buildRouter: (BuildContext context) => GridTile.Demo(),
  ),
  WidgetPoint(
    name: 'GridTileBar',
    routerName: GridTileBar.Demo.routeName,
    buildRouter: (BuildContext context) => GridTileBar.Demo(),
  ),
  WidgetPoint(
    name: 'GridView',
    routerName: GridView.Demo.routeName,
    buildRouter: (BuildContext context) => GridView.Demo(),
  )
];
