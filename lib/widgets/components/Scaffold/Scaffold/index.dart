/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:26
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> Scaffold 实现了基本的Material Design布局结构

在Material设计中定义的单个界面上的各种布局元素，在 Scaffold 中都有支持，比如 左边栏（Drawers）、snack bars、以及 bottom sheets。



### **基本用法**

Scaffold 有下面几个主要属性：

- appBar：显示在界面顶部的一个 AppBar

- body：当前界面所显示的主要内容 Widget

- floatingActionButton：Material设计中所定义的 FAB，界面的主要功能按钮

- persistentFooterButtons：固定在下方显示的按钮，比如对话框下方的确定、取消按钮

- drawer：侧边栏控件

- backgroundColor： 内容的背景颜色，默认使用的是 ThemeData.scaffoldBackgroundColor 的值

- bottomNavigationBar： 显示在页面底部的导航栏

- resizeToAvoidBottomPadding：控制界面内容 body 是否重新布局来避免底部被覆盖了，比如当键盘显示的时候，重新布局避免被键盘盖住内容。默认值为 true。

""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Scaffold/Scaffold';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Scaffold',
      codeUrl: 'components/Scaffold/Scaffold/demo.dart',
      contentList: [
        _Text0,
         ScaffoldDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/Scaffold-class.html',
    );
  }
}
