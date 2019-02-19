import "package:flutter/material.dart";

import '../../../model/widget.dart';
import 'Chip/index.dart' as Chip;
import 'ChipTheme/index.dart' as ChipTheme;
import 'ChipThemeData/index.dart' as ChipThemeData;
import 'ChoiceChip/index.dart' as ChoiceChip;
import 'FilterChip/index.dart' as FilterChip;
import 'InputChip/index.dart' as InputChip;
import 'RawChip/index.dart' as RawChip;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Chip',
    routerName: Chip.Demo.routeName,
    buildRouter: (BuildContext context) => Chip.Demo(),
  ),
  WidgetPoint(
    name: 'ChipTheme',
    routerName: ChipTheme.Demo.routeName,
    buildRouter: (BuildContext context) => ChipTheme.Demo(),
  ),
  WidgetPoint(
    name: 'ChipThemeData',
    routerName: ChipThemeData.Demo.routeName,
    buildRouter: (BuildContext context) => ChipThemeData.Demo(),
  ),
  WidgetPoint(
    name: 'ChoiceChip',
    routerName: ChoiceChip.Demo.routeName,
    buildRouter: (BuildContext context) => ChoiceChip.Demo(),
  ),
  WidgetPoint(
    name: 'FilterChip',
    routerName: FilterChip.Demo.routeName,
    buildRouter: (BuildContext context) => FilterChip.Demo(),
  ),
  WidgetPoint(
    name: 'InputChip',
    routerName: InputChip.Demo.routeName,
    buildRouter: (BuildContext context) => InputChip.Demo(),
  ),
  WidgetPoint(
    name: 'RawChip',
    routerName: RawChip.Demo.routeName,
    buildRouter: (BuildContext context) => RawChip.Demo(),
  ),
];
