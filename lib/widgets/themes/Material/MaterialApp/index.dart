/*
 * @Author: 一凨 
 * @Date: 2018-12-27 16:25:22 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-07 15:52:45
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';

const String content0 = '''
### **简介**
> MaterialApp 代表 Material  设计风格的应用
- 包含许多 Material设计风格所需要的一些基本控件
- 在 WidgetsApp 中通过添加一些特定与 Material 设计风格的属性
''';

const String content1 = '''
### **基本用法**
> 这里我们着重介绍MaterialApp 主要属性
- title ： 在任务管理窗口中所显示的应用名字
- theme ： 应用各种 UI 所使用的主题颜色
- color ： 应用的主要颜色值（primary color），也就是安卓任务管理窗口中所显示的应用颜色
- home ： 应用默认所显示的界面 Widget
- routes ： 应用的顶级导航表格，这个是多页面应用用来控制页面跳转的，类似于网页的网址
- initialRoute ：第一个显示的路由名字，默认值为 Window.defaultRouteName
- onGenerateRoute ： 生成路由的回调函数，当导航的命名路由的时候，会使用这个来生成界面
- onLocaleChanged ： 当系统修改语言的时候，会触发å这个回调
- navigatorObservers ： 应用 Navigator 的监听器
- debugShowMaterialGrid ： 是否显示 Material design 基础布局网格，用来调试 UI 的工具
- showPerformanceOverlay ： 显示性能标签
- checkerboardRasterCacheImages 、showSemanticsDebugger、debugShowCheckedModeBanner 各种调试开关

''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Material/MaterialApp';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
      ],
      title: 'MaterialApp',
      docUrl: 'https://docs.flutter.io/flutter/material/MaterialApp-class.html',
      codeUrl: 'themes/Material/MaterialApp/demo.dart',
    );
  }
}