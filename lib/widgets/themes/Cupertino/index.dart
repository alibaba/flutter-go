import 'package:flutter/material.dart';

import '../../../model/widget.dart';
import './CupertinoApp/index.dart' as CupertinoApp;
import './CupertinoButton/index.dart' as CupertinoButton;
import './CupertinoColors/index.dart' as CupertinoColors;
import './CupertinoIcons/index.dart' as CupertinoIcons;
import './CupertinoNavigationBar/index.dart' as CupertinoNavigationBar;
import './CupertinoPageRoute/index.dart' as CupertinoPageRoute;
import './CupertinoPageScaffold/index.dart' as CupertinoPageScaffold;
import './CupertinoPicker/index.dart' as CupertinoPicker;
import './CupertinoPopupSurface/index.dart' as CupertinoPopupSurface;
import './CupertinoScrollbar/index.dart' as CupertinoScrollbar;
import './CupertinoSlider/index.dart' as CupertinoSlider;
import './CupertinoSegmentedControl/index.dart' as CupertinoSegmentedControl;
import './CupertinoSliverNavigationBar/index.dart' as CupertinoSliverNavigationBar;
import './CupertinoSwitch/index.dart' as CupertinoSwitch;
import './CupertinoTabBar/index.dart' as CupertinoTabBar;
import './CupertinoTabScaffold/index.dart' as CupertinoTabScaffold;
import './CupertinoTabView/index.dart' as CupertinoTabView;
import './CupertinoTimerPicker/index.dart' as CupertinoTimerPicker;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'CupertinoPopupSurface',
    routerName: CupertinoPopupSurface.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoPopupSurface.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoPicker',
    routerName: CupertinoPicker.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoPicker.Demo(),
  ),
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
  WidgetPoint(
    name: 'CupertinoTabView',
    routerName: CupertinoTabView.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoTabView.Demo(),
  ),
  WidgetPoint(
    name: 'CupertinoTimerPicker',
    routerName: CupertinoTimerPicker.Demo.routeName,
    buildRouter: (BuildContext context) => CupertinoTimerPicker.Demo(),
  ),
];

