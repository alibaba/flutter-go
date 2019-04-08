/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:31
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import "package:flutter/material.dart";

import '../../../model/widget.dart';
import 'GridTile/index.dart' as GridTile;
import 'GridView/index.dart' as GridView;
import 'GridTileBar/index.dart' as GridTileBar;
import 'GridPaper/index.dart' as GridPaper;
import 'SliverGrid/index.dart' as SliverGrid;

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
  ),
  WidgetPoint(
    name: 'GridPaper',
    routerName: GridPaper.Demo.routeName,
    buildRouter: (BuildContext context) => GridPaper.Demo(),
  ),
  WidgetPoint(
    name: 'SliverGrid',
    routerName: SliverGrid.Demo.routeName,
    buildRouter: (BuildContext context) => SliverGrid.Demo(),
  )
];
