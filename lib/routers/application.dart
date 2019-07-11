import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_go/utils/shared_preferences.dart';

import '../model/widget.dart';
enum ENV {
  PRODUCTION,
  DEV,
}
class Application {
  /// 通过Application设计环境变量
  static ENV env = ENV.PRODUCTION;

  static Router router;
  static TabController controller;
  static SpUtil sharePeference;
  static CategoryComponent widgetTree;

  static Map<String, String> github = {
    'widgetsURL':'https://github.com/alibaba/flutter-go/blob/develop/lib/widgets/',
    //'develop':'https://github.com/alibaba-paimai-frontend/flutter-common-widgets-app/tree/develop/lib/widgets/',
    //'master':'https://github.com/alibaba-paimai-frontend/flutter-common-widgets-app/tree/master/lib/widgets/'
  };

  /// 所有获取配置的唯一入口
  Map<String, String> get config {
      if (Application.env == ENV.PRODUCTION) {
        return {};
      }
      if (Application.env == ENV.DEV) {
        return {};
      }
      return {};
  }

}
