/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/6
/// Time: 下午7:33
/// email: sanfann@alibaba-inc.com
/// target: ScaffoldState 的示例

import 'package:flutter_web/material.dart';

class ScaffoldStateDemo extends StatefulWidget {
  const ScaffoldStateDemo() : super();

  @override
  State<StatefulWidget> createState() => _ScaffoldStateDemo();
}

// AppBar 默认的实例,有状态
class _ScaffoldStateDemo extends State with SingleTickerProviderStateMixin {

  int count = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // 如果省略了 leading ，但 AppBar 在带有 Drawer 的 Scaffold 中，则会插入一个 button 以打开 Drawer。
    // 否则，如果最近的 Navigator 具有任何先前的 router ，则会插入BackButton。
    // 这种行为可以通过设置来关闭automaticallyImplyLeading 为false。在这种情况下，空的 leading widget 将导致 middle/title widget 拉伸开始。
    return  SizedBox(
        height: 500,
        child: Scaffold(
          key:_scaffoldKey,
          appBar: AppBar(
            title: Text('ScaffoldState Demo'),
          ),
          body:  Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('点我试试呼出SnackBar&Drawer'),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                    _scaffoldKey.currentState.showSnackBar(const SnackBar(
                        content: Text("我是通过ScaffoldState的方式呼出的SnackBar.")
                    ));
                  },
                )
              ],
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  accountName: Text('Peter Widget'),
                  accountEmail: Text('peter.widget@example.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/peter.png',
                      //package: 'assets',
                    ),
                  ),
                  margin: EdgeInsets.zero,
                ),
//                MediaQuery.removePadding(
//                  context: context,
//                  // DrawerHeader consumes top MediaQuery padding.
//                  removeTop: true,
//                  child: const ListTile(
//                    leading: Icon(Icons.payment),
//                    title: Text('Placeholder'),
//                  ),
//                ),
              ],
            ),
          ),

        )

    );
  }
}