import 'package:flutter/material.dart';
import 'package:flutter_go/common/widget_demo.dart';
import 'demo.dart';
const Text0 = '''
### **简介**
> ios风格下底部导航组件.

通过BottomNavigationBarItem列表,在屏幕底部展示多个小组件,  默认下选择第一个小组件;

### **基本用法**

这个组件, 没有任何内部状态, 使用时需要开发者自己去监听**onTap**方法, 主动为组件的属性**currentIndex**赋值

在官网上有这么一段文字:

> If the given backgroundColor's opacity is not 1.0 (which is the case by default), it will produce a blurring effect to the content behind it.

本人试了很多次. 也没有发现这个Blur Effect是怎么触发的, 如果有人了解, 欢迎提PR.
''';


class Demo extends StatefulWidget {
  static const String routeName =
      '/element/themes/Cupertino/CupertinoTabBar';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoTabBar',
      codeUrl: '/themes/Cupertino/CupertinoTabBar/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoTabBar-class.html',
      contentList: [
        Text0,
        CupertinoTabBarDemo()
      ],
    );
  }
}
