/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/2
/// Time: 上午12:06
/// email: zhu.yan@alibaba-inc.com
/// target: SnackBar 的示例
import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as SnackBarDemo;

const String _Text0 = """### **简介**
> SnackBar “屏幕底部消息”
- 带有可选操作的轻量级消息，短暂显示在屏幕底部
- SnackBar是用户操作后，显示提示信息的一个控件，类似Toast，会自动隐藏;
""";

const String _Text1 = """### **基本用法**
> Scaffold.of(context).showSnackBar()，传递描述消息的 SnackBar 实例;
- 要控制SnackBar保持可见的时间，请指定持续时间。
""";

class Demo extends StatefulWidget {
  static const String routeName = '/components//Bar/SnackBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SnackBar',
      codeUrl: 'components/Bar/SnackBar/demo.dart',
      contentList: allDomes(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/SnackBar-class.html',
    );
  }
}

//  所有的 SnackBar widget
//  context: 运行上下文
//  that: 指向有状态的 StatefulWidget
List allDomes(BuildContext context, _DemoState that) {
  return [
    _Text0,
    SizedBox(height: 20.0), // 间距
    _Text1,
    SizedBox(height: 20.0), // 间距
    SnackBarDemo.SnackBarLessDefault(),
    SizedBox(height: 20.0), // 间距
  ];
}
