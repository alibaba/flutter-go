/// @Author: 一凨 
/// @Date: 2018-12-22 20:37:51 
/// @Last Modified by:   一凨 
/// @Last Modified time: 2018-12-22 20:37:51 

import 'package:flutter/material.dart';

import '../../../model/widget.dart';
import './ScrollView/index.dart' as ScrollView;
import './Scrollable/index.dart' as Scrollable;
import './ScrollbarPainter/index.dart' as ScrollbarPainter;
import './ScrollMetrics/index.dart' as ScrollMetrics;
import './ScrollPhysics/index.dart' as ScrollPhysics;
import './BoxScrollView/index.dart' as BoxScrollView;
import './CustomScrollView/index.dart' as CustomScrollView;
import './NestedScrollView/index.dart' as NestedScrollView;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'ScrollView',
    routerName: ScrollView.Demo.routeName,
    buildRouter: (BuildContext context) => ScrollView.Demo(),
  ),
  WidgetPoint(
    name: 'Scrollable',
    routerName: Scrollable.Demo.routeName,
    buildRouter: (BuildContext context) => Scrollable.Demo(),
  ),
  WidgetPoint(
    name: 'ScrollbarPainter',
    routerName: ScrollbarPainter.Demo.routeName,
    buildRouter: (BuildContext context) => ScrollbarPainter.Demo(),
  ),
  WidgetPoint(
    name: 'ScrollMetrics',
    routerName: ScrollMetrics.Demo.routeName,
    buildRouter: (BuildContext context) => ScrollMetrics.Demo(),
  ),
  WidgetPoint(
    name: 'ScrollPhysics',
    routerName: ScrollPhysics.Demo.routeName,
    buildRouter: (BuildContext context) => ScrollPhysics.Demo(),
  ),
  WidgetPoint(
    name: 'BoxScrollView',
    routerName: BoxScrollView.Demo.routeName,
    buildRouter: (BuildContext context) => BoxScrollView.Demo(),
  ),
  WidgetPoint(
    name: 'CustomScrollView',
    routerName: CustomScrollView.Demo.routeName,
    buildRouter: (BuildContext context) => CustomScrollView.Demo(),
  ),
  WidgetPoint(
    name: 'NestedScrollView',
    routerName: NestedScrollView.Demo.routeName,
    buildRouter: (BuildContext context) => NestedScrollView.Demo(),
  ),
];