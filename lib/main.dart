import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';
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
import 'package:flutter_go/model/user_info.dart';
import 'package:flutter_jpush/flutter_jpush.dart';
import 'package:flutter_go/event/event_bus.dart';
import 'package:flutter_go/event/event_model.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_go/model/widget.dart';
import 'package:flutter_go/standard_pages/index.dart';
//import 'views/welcome_page/index.dart';

SpUtil sp;
var db;

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasLogin = false;
  bool _isLoading = true;
  UserInformation _userInfo;
  bool isConnected = false;
  String registrationId;
  List notificationList = [];
  int themeColor = 0xFFC91B3A;

  _MyAppState() {
    final eventBus = new EventBus();
    ApplicationEvent.event = eventBus;
  }

  @override
  void initState() {
    super.initState();
    _startupJpush();

    FlutterJPush.addConnectionChangeListener((bool connected) {
      setState(() {
        /// 是否连接，连接了才可以推送
        print("连接状态改变:$connected");
        this.isConnected = connected;
        if (connected) {
          //在启动的时候会去连接自己的服务器，连接并注册成功之后会返回一个唯一的设备号
          try {
            FlutterJPush.getRegistrationID().then((String regId) {
              print("主动获取设备号:$regId");
              setState(() {
                this.registrationId = regId;
              });
            });
          } catch (error) {
            print('主动获取设备号Error:$error');
          }
          ;
        }
      });
    });

    FlutterJPush.addReceiveNotificationListener(
        (JPushNotification notification) {
      setState(() {
        /// 收到推送
        print("收到推送提醒: $notification");
        notificationList.add(notification);
      });
    });

    FlutterJPush.addReceiveOpenNotificationListener(
        (JPushNotification notification) {
      setState(() {
        print("打开了推送提醒: $notification");

        /// 打开了推送提醒
        notificationList.add(notification);
      });
    });

    FlutterJPush.addReceiveCustomMsgListener((JPushMessage msg) {
      setState(() {
        print("收到推送消息提醒: $msg");

        /// 打开了推送提醒
        notificationList.add(msg);
      });
    });

    DataUtils.checkLogin().then((hasLogin) {
      if (hasLogin.runtimeType == UserInformation) {
        setState(() {
          _hasLogin = true;
          _isLoading = false;
          _userInfo = hasLogin;
          // 设置初始化的主题色
          // if (hasLogin.themeColor != 'default') {
          //   themeColor = int.parse(hasLogin.themeColor);
          // }
        });
      } else {
        setState(() {
          _hasLogin = hasLogin;
          _isLoading = false;
        });
      }
    }).catchError((onError) {
      setState(() {
        _hasLogin = false;
        _isLoading = false;
      });
      print('身份信息验证失败:$onError');
    });
    ApplicationEvent.event.on<UserSettingThemeColorEvent>().listen((event) {
      print('接收到的 event $event');
    });
  }

  showWelcomePage() {
    if (_isLoading) {
      return Container(
        color: Color(this.themeColor),
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
    } else {
      // 判断是否已经登录
      if (_hasLogin) {
        return AppPage(_userInfo);
      } else {
        return LoginPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
//    WidgetTree.getCommonItemByPath([15, 17], Application.widgetTree);
    return new MaterialApp(
      title: 'titles',
      theme: new ThemeData(
        primaryColor: Color(this.themeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(this.themeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(body: showWelcomePage()),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }
}

void _startupJpush() async {
  print("初始化jpush");
  await FlutterJPush.startup();
  print("初始化jpush成功");
}

void main() async {
  final provider = new Provider();
  await provider.init(true);
  sp = await SpUtil.getInstance();
  new SearchHistoryList(sp);

  await DataUtils.getWidgetTreeList().then((List json) {
    List data = WidgetTree.insertDevPagesToList(json, StandardPages().getLocalList());
    Application.widgetTree = WidgetTree.buildWidgetTree(data);
    print("Application.widgetTree>>>> ${Application.widgetTree}");
  });
  db = Provider.db;
  runApp(new MyApp());
}

