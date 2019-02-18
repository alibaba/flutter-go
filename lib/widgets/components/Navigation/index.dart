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

import 'BottomNavigationBar/index.dart' as BottomNavigationBar;
import 'BottomNavigationBarItem/index.dart' as BottomNavigationBarItem;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'BottomNavigationBar',
    routerName: BottomNavigationBar.Demo.routeName,
    buildRouter: (BuildContext context) => BottomNavigationBar.Demo(),
  ),
  WidgetPoint(
    name: 'BottomNavigationBarItem',
    routerName: BottomNavigationBarItem.Demo.routeName,
    buildRouter: (BuildContext context) => BottomNavigationBarItem.Demo(),
  )
];
