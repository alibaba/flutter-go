/*
 * @Author: 一凨 
 * @Date: 2018-11-16 15:09:19 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-07 15:37:07
 */
import '../../../../model/widget.dart';
import "package:flutter/material.dart";

import './AssetImage/index.dart' as AssetImage;
import './DecorationImage/index.dart' as DecorationImage;
import './DecorationImagePainter/index.dart' as DecorationImagePainter;
import './ExactAssetImage/index.dart' as ExactAssetImage;
import './FadeInImage/index.dart' as FadeInImage;
import './FileImage/index.dart' as FileImage;
import './MemoryImage/index.dart' as MemoryImage;
import './NetworkImage/index.dart' as NetworkImage;
import './paintImage/index.dart' as paintImage;
import './precacheImage/index.dart' as precacheImage;
import './RawImage/index.dart' as RawImage;
import './Image/index.dart' as Image;


List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'AssetImage',
    routerName: AssetImage.Demo.routeName,
    buildRouter: (BuildContext context) => AssetImage.Demo(),
  ),
  WidgetPoint(
    name: 'DecorationImage',
    routerName: DecorationImage.Demo.routeName,
    buildRouter: (BuildContext context) => DecorationImage.Demo(),
  ),
  WidgetPoint(
    name: 'DecorationImagePainter',
    routerName: DecorationImagePainter.Demo.routeName,
    buildRouter: (BuildContext context) => DecorationImagePainter.Demo(),
  ),
  WidgetPoint(
    name: 'ExactAssetImage',
    routerName: ExactAssetImage.Demo.routeName,
    buildRouter: (BuildContext context) => ExactAssetImage.Demo(),
  ),
  WidgetPoint(
    name: 'FadeInImage',
    routerName: FadeInImage.Demo.routeName,
    buildRouter: (BuildContext context) => FadeInImage.Demo(),
  ),
  WidgetPoint(
    name: 'FileImage',
    routerName: FileImage.Demo.routeName,
    buildRouter: (BuildContext context) => FileImage.Demo(),
  ),
  WidgetPoint(
    name: 'MemoryImage',
    routerName: MemoryImage.Demo.routeName,
    buildRouter: (BuildContext context) => MemoryImage.Demo(),
  ),
  WidgetPoint(
    name: 'NetworkImage',
    routerName: NetworkImage.Demo.routeName,
    buildRouter: (BuildContext context) => NetworkImage.Demo(),
  ),
  WidgetPoint(
    name: 'paintImage',
    routerName: paintImage.Demo.routeName,
    buildRouter: (BuildContext context) => paintImage.Demo(),
  ),
  WidgetPoint(
    name: 'precacheImage',
    routerName: precacheImage.Demo.routeName,
    buildRouter: (BuildContext context) => precacheImage.Demo(),
  ),
  WidgetPoint(
    name: 'RawImage',
    routerName: RawImage.Demo.routeName,
    buildRouter: (BuildContext context) => RawImage.Demo(),
  ),
  WidgetPoint(
    name: 'Image',
    routerName: Image.Demo.routeName,
    buildRouter: (BuildContext context) => Image.Demo(),
  ),
];