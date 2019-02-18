/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/12/27
 * Time: 下午2:50
 * email: zhu.yan@alibaba-inc.com
 * tartget: FlatButton 的示例
 */
import "package:flutter/material.dart";
import '../../../model/widget.dart';

import 'Card/index.dart' as Card;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Card',
    routerName: Card.Demo.routeName,
    buildRouter: (BuildContext context) => Card.Demo(),
  )
];
