import "package:flutter/material.dart";
import '../../../model/widget.dart';
import './CupertinoScrollbar/index.dart' as CupertinoScrollbar;
import './CupertinoSlider/index.dart' as CupertinoSlider;
import './CupertinoSegmentedControl/index.dart' as CupertinoSegmentedControl;
import './CupertinoSliverNavigationBar/index.dart' as CupertinoSliverNavigationBar;
import './CupertinoSwitch/index.dart' as CupertinoSwitch;
import './CupertinoTabBar/index.dart' as CupertinoTabBar;
import './CupertinoTabScaffold/index.dart' as CupertinoTabScaffold;
List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'CupertinoScrollbar',
    routerName: CupertinoScrollbar.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoScrollbar.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoSlider',
    routerName: CupertinoSlider.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoSlider.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoSegmentedControl',
    routerName: CupertinoSegmentedControl.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoSegmentedControl.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoSliverNavigationBar',
    routerName: CupertinoSliverNavigationBar.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoSliverNavigationBar.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoSliverRefreshControl',
    routerName: CupertinoSliverNavigationBar.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoSliverNavigationBar.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoSwitch',
    routerName: CupertinoSwitch.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoSwitch.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoTabBar',
    routerName: CupertinoTabBar.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoTabBar.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoTabScaffold',
    routerName: CupertinoTabScaffold.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoTabScaffold.Demo(),
  ),
];
