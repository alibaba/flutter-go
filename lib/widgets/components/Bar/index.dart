/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/12/27
 * Time: 下午2:50
 * email: zhu.yan@alibaba-inc.com
 * tartget: FlatButton 的示例
 */
import "package:flutter/material.dart";
import '../../../model/widget.dart';

import 'SliverAppBar/index.dart' as SliverAppBar;
import 'AppBar/index.dart' as AppBar;
import 'BottomAppBar/index.dart' as BottomAppBar;
import 'FlexibleSpaceBar/index.dart' as FlexibleSpaceBar;
import 'ButtonBar/index.dart' as ButtonBar;
import 'SnackBar/index.dart' as SnackBar;
import 'SnackBarAction/index.dart' as SnackBarAction;
import 'TabBar/index.dart' as TabBar;


List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'AppBar',
    routerName: AppBar.Demo.routeName,
    buildRouter: (BuildContext context) => AppBar.Demo(),
  ),
  WidgetPoint(
    name: 'SliverAppBar',
    routerName: SliverAppBar.Demo.routeName,
    buildRouter: (BuildContext context) => SliverAppBar.Demo(),
  ),
  WidgetPoint(
    name: 'BottomAppBar',
    routerName: BottomAppBar.Demo.routeName,
    buildRouter: (BuildContext context) => BottomAppBar.Demo(),
  ),
  WidgetPoint(
    name: 'FlexibleSpaceBar',
    routerName: FlexibleSpaceBar.Demo.routeName,
    buildRouter: (BuildContext context) => FlexibleSpaceBar.Demo(),
  ),
  WidgetPoint(
    name: 'ButtonBar',
    routerName: ButtonBar.Demo.routeName,
    buildRouter: (BuildContext context) => ButtonBar.Demo(),
  ),
  WidgetPoint(
    name: 'SnackBar',
    routerName: SnackBar.Demo.routeName,
    buildRouter: (BuildContext context) => SnackBar.Demo(),
  ),
  WidgetPoint(
    name: 'SnackBarAction',
    routerName: SnackBarAction.Demo.routeName,
    buildRouter: (BuildContext context) => SnackBarAction.Demo(),
  ),
  WidgetPoint(
    name: 'TabBar',
    routerName: TabBar.Demo.routeName,
    buildRouter: (BuildContext context) => TabBar.Demo(),
  ),
  WidgetPoint(
    name: 'TabBarView',
    routerName: TabBar.Demo.routeName,
    buildRouter: (BuildContext context) => TabBar.Demo(),
  ),
];
