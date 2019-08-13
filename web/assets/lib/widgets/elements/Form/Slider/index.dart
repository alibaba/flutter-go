import 'package:flutter_web/material.dart';

import '../../../../model/widget.dart';
import "Slider/index.dart" as Slider;
import "SliderTheme/index.dart" as SliderTheme;
import "SliderThemeData/index.dart" as SliderThemeData;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Slider',
    routerName: Slider.Demo.routeName,
    buildRouter: (BuildContext context) => Slider.Demo(),
  ),
  WidgetPoint(
    name: 'SliderTheme',
    routerName: SliderTheme.Demo.routeName,
    buildRouter: (BuildContext context) => SliderTheme.Demo(),
  ),
  WidgetPoint(
    name: 'SliderThemeData',
    routerName: SliderThemeData.Demo.routeName,
    buildRouter: (BuildContext context) => SliderThemeData.Demo(),
  )
];
