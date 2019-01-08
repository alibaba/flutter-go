import "package:flutter/material.dart";
import '../../../model/widget.dart';
import 'AlertDialog/index.dart' as AlertDialog;
import 'Dialog/index.dart' as Dialog;
import 'SimpleDialog/index.dart' as SimpleDialog;
import 'AboutDialog/index.dart' as AboutDialog;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'AlertDialog',
    routerName: AlertDialog.Demo.routeName,
    buildRouter: (BuildContext context) => AlertDialog.Demo(),
  ),
  WidgetPoint(
    name: 'Dialog',
    routerName: Dialog.Demo.routeName,
    buildRouter: (BuildContext context) => Dialog.Demo(),
  ),
  WidgetPoint(
    name: 'SimpleDialog',
    routerName: SimpleDialog.Demo.routeName,
    buildRouter: (BuildContext context) => SimpleDialog.Demo(),
  ),
  WidgetPoint(
    name: 'AboutDialog',
    routerName: AboutDialog.Demo.routeName,
    buildRouter: (BuildContext context) => AboutDialog.Demo(),
  ),
];
