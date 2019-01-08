import "package:flutter/material.dart";
import '../../../model/widget.dart';

import 'YearPicker/index.dart' as YearPicker;
import 'DayPicker/index.dart' as DayPicker;
import 'MonthPicker/index.dart' as MonthPicker;
import 'ShowdatePicker/index.dart' as ShowdatePicker;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'YearPicker',
    routerName: YearPicker.Demo.routeName,
    buildRouter: (BuildContext context) => YearPicker.Demo(),
  ),
  WidgetPoint(
    name: 'MonthPicker',
    routerName: MonthPicker.Demo.routeName,
    buildRouter: (BuildContext context) => MonthPicker.Demo(),
  ),
  WidgetPoint(
    name: 'DayPicker',
    routerName: DayPicker.Demo.routeName,
    buildRouter: (BuildContext context) => DayPicker.Demo(),
  ),
  WidgetPoint(
    name: 'ShowdatePicker',
    routerName: ShowdatePicker.Demo.routeName,
    buildRouter: (BuildContext context) => ShowdatePicker.Demo(),
  ),
];
