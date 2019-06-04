import 'package:flutter/material.dart';
import 'package:flutter_go/model/user_info.dart';
import 'package:share/share.dart';
import 'package:flutter_go/utils/data_utils.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/routers/routers.dart';

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

  @override
  void initState() {
    super.initState();
    hasLogin = this.widget.userInfo.id != 0;
  }

  @override
  Widget build(BuildContext context) {
    print(hasLogin);
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
            Icons.favorite,
            size: 27.0,
          ),
          title: Text(
            '我的收藏',
            style: textStyle,
          ),
          onTap: () {},
        ),
        // new Divider(),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 27.0,
          ),
          title: Text(
            '更多设置',
            style: textStyle,
          ),
          onTap: () {},
        ),
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
            DataUtils.feedback({
              'title': "这是客户端 FeedBack title",
              "body": "这是客户端 FeedBack body"
            }).then((result) {
              print(result);
            });
          },
        ),
        ListTile(
          leading: Icon(
            Icons.info,
            size: 27.0,
          ),
          title: Text(
            '关于 App',
            style: textStyle,
          ),
          onTap: () {},
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
            Share.share('https://github.com/alibaba/flutter-go');
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
            if (hasLogin) {
              // 退出登陆
              DataUtils.logout().then((result) {
                if (result) {
                  setState(() {
                    hasLogin = false;
                  });
                  Application.router.navigateTo(context, '${Routes.loginPage}');
                }
              });
            } else {
              Application.router.navigateTo(context, '${Routes.loginPage}');
            }
          },
        ),
      ],
    );
  }
}
