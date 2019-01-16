import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'common/provider.dart';

import 'views/welcome_page/index.dart';

const int ThemeColor = 0xFFC91B3A;

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(
        body: new WelcomePage(),
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}

var db;

void main() async {
  final provider = new Provider();
  await provider.init(true);
  db = Provider.db;
  runApp(new MyApp());
}
