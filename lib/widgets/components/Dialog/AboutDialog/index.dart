/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:26
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> AboutDialog 通常用于传递企业或者app的官方信息
- 这个对话框包含应用程序的图标，名称，版本号，版权和应用程序使用到的软件许可证的按钮


### **基本用法**
> 要显示的AboutDialog，使用showAboutDialog。
- 如果应用程序具有Drawer，则AboutListTile可以使显示AboutDialog的过程更简单。
- AboutDialog通过showAboutDialog 显示按钮调用 showLicensePage。

""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Dialog/AboutDialog';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'AboutDialog',
      codeUrl: 'components/Dialog/AboutDialog/demo.dart',
      contentList: [
        _Text0,
        AboutDialogDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/AboutDialog-class.html',
    );
  }
}
