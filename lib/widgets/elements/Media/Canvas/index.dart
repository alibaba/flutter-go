import 'package:flutter_go/model/widget.dart';
import "package:flutter/material.dart";

import 'PainterSketch/index.dart' as PainterSketch;
import 'Canvas/index.dart' as Canvas;
import 'PainterPath/index.dart' as PainterPath;
import 'CircleProgressBarPainter/index.dart' as CircleProgressBarPainter;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'PainterSketch',
    routerName: PainterSketch.Demo.routeName,
    buildRouter: (BuildContext context) => PainterSketch.Demo(),
  ),
  WidgetPoint(
    name: 'Canvas',
    routerName: Canvas.Demo.routeName,
    buildRouter: (BuildContext context) => Canvas.Demo(),
  ),
  WidgetPoint(
    name: 'PainterPath',
    routerName: PainterPath.Demo.routeName,
    buildRouter: (BuildContext context) => PainterPath.Demo(),
  ),
  WidgetPoint(
    name: 'CircleProgressBarPainter',
    routerName: CircleProgressBarPainter.Demo.routeName,
    buildRouter: (BuildContext context) => CircleProgressBarPainter.Demo(),
  )
];
