import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_go/utils/shared_preferences.dart';

import '../model/widget.dart';

class Application {
  static Router router;
  static TabController controller;
  static SpUtil sharePeference;
  static CategoryComponent widgetTree;

  static Map<String, String> github = {
    'widgetsURL':'https://github.com/alibaba/flutter-go/blob/develop/lib/widgets/',
    //'develop':'https://github.com/alibaba-paimai-frontend/flutter-common-widgets-app/tree/develop/lib/widgets/',
    //'master':'https://github.com/alibaba-paimai-frontend/flutter-common-widgets-app/tree/master/lib/widgets/'
  };

}
