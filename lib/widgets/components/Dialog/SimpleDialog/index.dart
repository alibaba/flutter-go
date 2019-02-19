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
> SimpleDialog 是一个用于向用户传递确定信息并提供选项的弹出层
- SimpleDialog 可为用户提供多个选项选择。有一个可选的标题，显示在选项上方



### **基本用法**

> 通常作为子窗口小部件传递给showDialog，后者显示对话框。
- 选择通常使用SimpleDialogOption表示
- 对于通知用户情况的对话框，请考虑使用 AlertDialog。

""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Dialog/SimpleDialog';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SimpleDialog',
      codeUrl: 'components/Dialog/SimpleDialog/demo.dart',
      contentList: [
        _Text0,
        SimpleDialogDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/SimpleDialog-class.html',
    );
  }
}
