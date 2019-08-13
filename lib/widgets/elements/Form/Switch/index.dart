import 'package:flutter_web/material.dart';

import '../../../../model/widget.dart';
import "Switch/index.dart" as Switch;
import "SwitchListTile/index.dart" as SwitchListTile;
import "AnimatedSwitcher/index.dart" as AnimatedSwitcher;


List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Switch',
    routerName: Switch.Demo.routeName,
    buildRouter: (BuildContext context) => Switch.Demo(),
  ),
  WidgetPoint(
    name: 'SwitchListTile',
    routerName: SwitchListTile.Demo.routeName,
    buildRouter: (BuildContext context) => SwitchListTile.Demo(),
  ),
  WidgetPoint(
    name: 'AnimatedSwitcher',
    routerName: AnimatedSwitcher.Demo.routeName,
    buildRouter: (BuildContext context) => AnimatedSwitcher.Demo(),
  )
];
