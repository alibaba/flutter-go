import "package:flutter/material.dart";
import '../../../model/widget.dart';


import './CupertinoApp/index.dart' as CupertinoApp;
import './CupertinoButton/index.dart' as CupertinoButton;
import './CupertinoColors/index.dart' as CupertinoColors;
import './CupertinoIcons/index.dart' as CupertinoIcons;
import './CupertinoNavigationBar/index.dart' as CupertinoNavigationBar;
import './CupertinoPageRoute/index.dart' as CupertinoPageRoute;
import './CupertinoPageScaffold/index.dart' as CupertinoPageScaffold;

import './CupertinoScrollbar/index.dart' as CupertinoScrollbar;
import './CupertinoSlider/index.dart' as CupertinoSlider;
import './CupertinoSegmentedControl/index.dart' as CupertinoSegmentedControl;
import './CupertinoSliverNavigationBar/index.dart' as CupertinoSliverNavigationBar;
import './CupertinoSwitch/index.dart' as CupertinoSwitch;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'CupertinoPageScaffold',
    routerName: CupertinoPageScaffold.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoPageScaffold.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoPageRoute',
    routerName: CupertinoPageRoute.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoPageRoute.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoNavigationBar',
    routerName: CupertinoNavigationBar.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoNavigationBar.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoIcons',
    routerName: CupertinoIcons.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoIcons.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoColors',
    routerName: CupertinoColors.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoColors.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoButton',
    routerName: CupertinoButton.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoButton.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoApp',
    routerName: CupertinoApp.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoApp.Demo(),
  ),
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

