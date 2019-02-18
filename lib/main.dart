import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'package:flutter_go/utils/provider.dart';
import 'package:flutter_go/utils/shared_preferences.dart';
import 'package:flutter_go/views/first_page/home.dart';
import 'package:flutter_go/model/search_history.dart';
import 'views/welcome_page/index.dart';

const int ThemeColor = 0xFFC91B3A;
SpUtil sp;
var db;

class MyApp extends StatelessWidget {
  MyApp()  {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  showWelcomePage() {
    bool showWelcome = sp.getBool(SharedPreferencesKeys.showWelcome);
    if (showWelcome == null || showWelcome == true) {
      return WelcomePage();
    } else {
      return AppPage();
    }
  }
  @override
  Widget build(BuildContext context) {
    showWelcomePage();
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
        body: showWelcomePage()
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}


void main() async {
  final provider = new Provider();
  await provider.init(true);
  sp = await SpUtil.getInstance();
  new SearchHistoryList(sp);
  db = Provider.db;
  runApp(new MyApp());
}
