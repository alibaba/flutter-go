/// Created with Android Studio.
/// User: sanfan.hx
/// Date: 2019/1/6
/// Time: 下午17:08
/// email: sanfan.hx@alibaba-inc.com
/// target: SnackBarAction 的示例

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as SnackBarDemo;

const String _Text0 = """
### **简介**
> SnackBarAction “屏幕底部消息右侧可操作的行为”

- 带有可选操作的轻量级消息，短暂显示在屏幕底部, 并提供按钮交互。

### **基本用法**

> 为SnackBar加入action[SnackBarAction]显示按区, 默认下是隐藏的

""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Bar/SnackBarAction';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SnackBarAction',
      codeUrl: 'components/Bar/SnackBarAction/demo.dart',
      contentList: [
        _Text0,
        SnackBarDemo.SnackBarActionDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/SnackBarAction-class.html',
    );
  }
}
