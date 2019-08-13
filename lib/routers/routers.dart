
import 'fluro/fluro.dart';
import 'package:flutter_web/material.dart';

import '../widgets/index.dart' show WidgetDemoList;
import './router_handler.dart' show homeHandler,categoryHandler,widgetNotFoundHandler,fullScreenCodeDialog,webViewPageHand;

class Routes {
  static String root = "/";
  static String home = "/home";
  static String widgetDemo = '/widget-demo';
  static String codeView = '/code-view';
  static String webViewPage = '/web-view-page';

  static void configureRoutes(Router router) {
    List widgetDemosList = new WidgetDemoList().getDemos();
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        });
    router.define(home, handler: homeHandler);

    router.define('/category/:type', handler: categoryHandler);
    router.define('/category/error/404', handler: widgetNotFoundHandler);
    router.define(codeView,handler:fullScreenCodeDialog);
    router.define(webViewPage,handler:webViewPageHand);
      widgetDemosList.forEach((demo) {
        Handler handler = new Handler(
            handlerFunc: (BuildContext context, Map<String, List<String>> params) {
              print('组件路由params=$params widgetsItem=${demo.routerName}');
              return demo.buildRouter(context);
      });
      router.define('${demo.routerName}', handler: handler);
    });
  }
}
