import "package:flutter/material.dart";

import '../../../model/widget.dart';
import 'ExpansionPanel/index.dart' as ExpansionPanel;
import 'ExpansionPanelList/index.dart' as ExpansionPanelList;
import 'ExpansionPanelRadio/index.dart' as ExpansionPanelRadio;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'ExpansionPanel',
    routerName: ExpansionPanel.Demo.routeName,
    buildRouter: (BuildContext context) => ExpansionPanel.Demo(),
  ),
  WidgetPoint(
    name: 'ExpansionPanelRadio',
    routerName: ExpansionPanelRadio.Demo.routeName,
    buildRouter: (BuildContext context) => ExpansionPanelRadio.Demo(),
  ),
  WidgetPoint(
    name: 'ExpansionPanelList',
    routerName: ExpansionPanelList.Demo.routeName,
    buildRouter: (BuildContext context) => ExpansionPanelList.Demo(),
  ),

];
