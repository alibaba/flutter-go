import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_go/utils/provider.dart';
import 'package:flutter_go/utils/shared_preferences.dart';
import 'package:flutter_go/views/home.dart';
import 'package:flutter_go/model/search_history.dart';
import 'package:flutter_go/utils/analytics.dart' as Analytics;
import 'package:flutter_go/views/login_page/login_page.dart';
import 'package:flutter_go/utils/data_utils.dart';

//import 'views/welcome_page/index.dart';

const int ThemeColor = 0xFFC91B3A;
SpUtil sp;
var db;

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasLogin = false;
  bool _isLoading = true;
  String localVersion;
  String currVersion;

  @override
  Future initState() {
    super.initState();

    DataUtils.checkVersion({'name': 'FlutterGo'}).then((bool) {
      if (bool) {
        _UpdateURL();
      }
    }).catchError((onError) {
      print('获取失败:$onError');
    });

    DataUtils.checkLogin().then((hasLogin) {
      setState(() {
        _hasLogin = hasLogin;
        _isLoading = false;
      });
    }).catchError((onError) {
      setState(() {
        _hasLogin = true;
        _isLoading = false;
      });
      print('身份信息验证失败:$onError');
    });
  }

  showWelcomePage() {
    if (_isLoading) {
      return Container(
        color: const Color(ThemeColor),
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
    } else {
      // 判断是否已经登录
      if (_hasLogin) {
        return AppPage();
      } else {
        return LoginPage();
      }
    }
  }

  _UpdateURL() async {
    const currUrl =
        'https://github.com/alibaba/flutter-go/raw/master/FlutterGo.apk';
    if (await canLaunch(currUrl)) {
      await launch(currUrl);
    } else {
      throw 'Could not launch $currUrl';
    }
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
      home: new Scaffold(body: showWelcomePage()),
      //去掉debug logo
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      navigatorObservers: <NavigatorObserver>[Analytics.observer],
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
