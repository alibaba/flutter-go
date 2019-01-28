import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';
const Text0 = '''
### **简介**

> 实现iOS应用程序的选项卡式的根布局与结构。

一个在底部放置标签栏，标签栏之间或后面放置内容的脚手架.

这个脚手架, tabBar组件与tabBuilder组件是必须配置的。如果你为该脚手架配置的tabBar组件是 **CupertinoTabBar**的话. 它会自动监听**CupertinoTabBar**底部的切换事件, 去动态切换主体显示的内容.


选项卡的内容是使用**tabBuilder**选项卡生成器生成的。TabBuilder必须能够生成tabbar中组件数组长度相同数量的组件。不活动的选项卡将被移到后台并禁用其动画。


使用cupertinobview作为每个选项卡的内容，以支持具有并行导航状态和历史记录的选项卡。


通过BottomNavigationBarItem列表,在屏幕底部展示多个小组件,  默认下选择第一个小组件;

### **基本用法**


''';


class Demo extends StatefulWidget {
  static const String routeName =
      '/element/themes/Cupertino/CupertinoTabScaffold';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoTabScaffold',
      codeUrl: '/themes/Cupertino/CupertinoTabScaffold/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoTabScaffold-class.html',
      contentList: [
        Text0,
        CupertinoTabScaffoldDemo()
      ],
    );
  }
}
