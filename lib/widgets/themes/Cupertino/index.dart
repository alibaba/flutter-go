import "package:flutter/material.dart";
import '../../../model/widget.dart';
import './CupertinoScrollbar/index.dart' as CupertinoScrollbar;
import './CupertinoSlider/index.dart' as CupertinoSlider;
import './CupertinoSegmentedControl/index.dart' as CupertinoSegmentedControl;
import './CupertinoSliverNavigationBar/index.dart' as CupertinoSliverNavigationBar;
import './CupertinoSwitch/index.dart' as CupertinoSwitch;
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
];
