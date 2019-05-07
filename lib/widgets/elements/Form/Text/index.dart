import "package:flutter/material.dart";

import '../../../../model/widget.dart';
import 'RichText/index.dart' as RichText;
import 'Text/index.dart' as Text;


List<WidgetPoint> widgetPoints = [
   WidgetPoint(
     name: 'RichText',
     routerName: RichText.Demo.routeName,
     buildRouter: (BuildContext context) => RichText.Demo(),
   ),
  WidgetPoint(
    name: 'Text',
    routerName: Text.Demo.routeName,
    buildRouter: (BuildContext context) => Text.Demo(),
  ),
];