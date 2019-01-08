/*
 * @Author: 一凨 
 * @Date: 2018-12-22 20:37:45 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-22 20:43:15
 */
import 'package:flutter/material.dart';
import '../../../model/widget.dart';

import './Tab/index.dart' as Tab;


List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name:'Tab',
    routerName: Tab.Demo.routeName,
    buildRouter: (BuildContext context) => Tab.Demo(),
  ),
];