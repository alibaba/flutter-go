/// @Author: 一凨
/// @Date: 2018-12-22 21:01:42
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-27 14:53:04

import 'package:flutter/material.dart';

import '../../../model/widget.dart';
import './CheckedPopupMenuItem/index.dart' as CheckedPopupMenuItem;
import './DropdownMenuItem/index.dart' as DropdownMenuItem;
import './PopupMenuButton/index.dart' as PopupMenuButton;
import './PopupMenuDivider/index.dart' as PopupMenuDivider;
import './PopupMenuEntry/index.dart' as PopupMenuEntry;
import './PopupMenuItemState/index.dart' as PopupMenuItemState;
import './PopupMenuItem/index.dart' as PopupMenuItem;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'CheckedPopupMenuItem',
    routerName: CheckedPopupMenuItem.Demo.routeName,
    buildRouter: (BuildContext context) => CheckedPopupMenuItem.Demo(),
  ),
  WidgetPoint(
    name: 'DropdownMenuItem',
    routerName: DropdownMenuItem.Demo.routeName,
    buildRouter: (BuildContext context) => DropdownMenuItem.Demo(),
  ),
  WidgetPoint(
    name: 'PopupMenuButton',
    routerName: PopupMenuButton.Demo.routeName,
    buildRouter: (BuildContext context) => PopupMenuButton.Demo(),
  ),
  WidgetPoint(
    name: 'PopupMenuDivider',
    routerName: PopupMenuDivider.Demo.routeName,
    buildRouter: (BuildContext context) => PopupMenuDivider.Demo(),
  ),
  WidgetPoint(
    name: 'PopupMenuEntry',
    routerName: PopupMenuEntry.Demo.routeName,
    buildRouter: (BuildContext context) => PopupMenuEntry.Demo(),
  ),
  WidgetPoint(
    name: 'PopupMenuItemState',
    routerName: PopupMenuItemState.Demo.routeName,
    buildRouter: (BuildContext context) => PopupMenuItemState.Demo(),
  ),
  WidgetPoint(
    name: 'PopupMenuItem',
    routerName: PopupMenuItem.Demo.routeName,
    buildRouter: (BuildContext context) => PopupMenuItem.Demo(),
  ),
];
