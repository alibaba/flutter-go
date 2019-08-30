import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_go/components/single_theme_color.dart';
import 'package:flutter_go/model/user_info.dart';
import 'package:share/share.dart';
import 'package:flutter_go/utils/data_utils.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/routers/routers.dart';
import './search_page.dart';
import 'package:flutter_go/event/event_bus.dart';
import 'package:flutter_go/event/event_model.dart';
import 'package:event_bus/event_bus.dart';

const List<Map<String, dynamic>> defalutThemeColor = [
  {'cnName': 'Flutter篮', 'value': 0xFF3391EA},
  {'cnName': '拍卖红', 'value': 0xFFC91B3A},
  {'cnName': '阿里橙', 'value': 0xFFF7852A},
];

class DrawerPage extends StatefulWidget {
  final UserInformation userInfo;
  DrawerPage({Key key, this.userInfo}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
  bool hasLogin;

  _DrawerPageState() {
    final eventBus = new EventBus();
    ApplicationEvent.event = eventBus;
  }

  @override
  void initState() {
    super.initState();
    ApplicationEvent.event.on<UserSettingThemeColorEvent>().listen((event) {
      print('接收到的 event ${event.settingThemeColor}');
    });
    hasLogin = this.widget.userInfo.id != 0;
  }

  Future<AlertDialog> logoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('确认退出登陆？'),
            // content: Text('退出登陆后将没法进行'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  // 退出登陆
                  DataUtils.logout().then((result) {
                    if (result) {
                      Application.router.navigateTo(
                          context, '${Routes.loginPage}',
                          transition: TransitionType.native, clearStack: true);
                    }
                  });
                },
                child: Text(
                  '确认',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('取消'),
              )
            ],
          );
        });
  }

  void showLogoutDialog(BuildContext context) {
    if (hasLogin) {
      logoutDialog(context);
    } else {
      Application.router.navigateTo(context, '${Routes.loginPage}',
          transition: TransitionType.native, clearStack: true);
    }
  }

  void pushPage(BuildContext context, Widget page, {String pageName}) {
    if (context == null || page == null) return;
    Navigator.push(context, CupertinoPageRoute<void>(builder: (ctx) => page));
  }

  Future<Dialog> buildSimpleDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                height: 300.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: buildThemeColorChildren(),
                )),
          );
        });
  }

  List<Widget> buildThemeColorChildren() {
    List<Widget> tempWidget = [];
    for (var i = 0; i < defalutThemeColor.length; i++) {
      tempWidget.add(SingleThemeColor(
        themeColor: defalutThemeColor[i]['value'],
        coloeName: defalutThemeColor[i]['cnName'],
      ));
    }
    return tempWidget;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(''),
          accountEmail: Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              hasLogin ? widget.userInfo.username : ' ',
              style: TextStyle(fontSize: 28),
            ),
          ),
          decoration: BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(hasLogin
                  ? widget.userInfo.avatarPic
                  : 'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658'),
            ),
          ),
        ),
        // new Divider(),
        ListTile(
          leading: Icon(
            Icons.search,
            size: 27.0,
          ),
          title: Text(
            '全网搜',
            style: textStyle,
          ),
          onTap: () {
            pushPage(context, SearchPage(), pageName: "SearchPage");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            size: 27.0,
          ),
          title: Text(
            '我的收藏',
            style: textStyle,
          ),
          onTap: () {
            Application.router.navigateTo(context,
                '${Routes.collectionFullPage}?hasLogin=${hasLogin.toString()}',
                transition: TransitionType.fadeIn);
          },
        ),
        // new Divider(),
        // ListTile(
        //   leading: Icon(
        //     Icons.settings,
        //     size: 27.0,
        //   ),
        //   title: Text(
        //     '主题色',
        //     style: textStyle,
        //   ),
        //   onTap: () {
        //     buildSimpleDialog(context);
        //   },
        // ),
        new Divider(),

        ListTile(
          leading: Icon(
            Icons.email,
            size: 27.0,
          ),
          title: Text(
            '反馈/建议',
            style: textStyle,
          ),
          onTap: () {
            if (hasLogin) {
              //issue 未登陆状态 返回登陆页面
              Application.router.navigateTo(context, '${Routes.issuesMessage}');
            } else {
              //No description provided.
              Application.router.navigateTo(context, '${Routes.loginPage}');

            }
          },
        ),
        ListTile(
          leading: Icon(
            Icons.share,
            size: 27.0,
          ),
          title: Text(
            '分享 App',
            style: textStyle,
          ),
          onTap: () {
            Share.share('https://flutter-go.pub/website/');
          },
        ),
        new Divider(),
        ListTile(
          leading: Icon(
            hasLogin ? Icons.exit_to_app : Icons.supervised_user_circle,
            size: 27.0,
          ),
          title: Text(
            hasLogin ? '退出登陆' : '点击登录',
            style: textStyle,
          ),
          onTap: () {
            showLogoutDialog(context);
            // logoutDialog(context);
          },
        ),
      ],
    );
  }
}
