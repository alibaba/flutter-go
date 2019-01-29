/*
 * @Author: 一凨 
 * @Date: 2018-12-10 20:30:53 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-14 20:36:57
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';


const String contentText0 = '''
### **简介**
> 一个可以使内容滚动的Widget
可滚动的 widget 包含三部分
- 一个Scrollable的widget，可以用来监听用户的一些手势事件
- 例如Viewport和ShrinkWrappingViewport的视图widget，可以通过在滚动视图中仅展示部分widget来进行可视化设计
- 一个或者多个组件，可以通过组合来实现各种滚动效果。例如列表、网格等
''';

const String contentText1 = '''
### **基本用法**
> ScrollView 属于抽象类，不能直接实例化.

例如ListView widget是通过继承 BoxScrollView 然后BoxScrollView通过继承ScrollView来实现继承

- ListView ： 一个常用的ScrollView,它显示子窗口小部件的滚动线性列表
- PageView：同样是一个可滚动的视图列表，但是他每一个子widget都是视口窗口的大小
- GridView: 一个显示二维子widget的ScrollView
- CustomScrollView: 一个使用 Slivers来创建各种自定义滚动效果的ScrollView
- SingleChildScrollView：一个只有一个子widget的ScrollView
- ScrollNotification、NotificationListener：它可以用于在不使用ScrollController的情况下查看滚动位置的widget
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/ScrollView';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'components/Scroll/ScrollView/demo.dart',
      contentList: [
        contentText0,
        contentText1,
        ScrollViewDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/ScrollView-class.html',
      title: 'ScrollView',
    );
  }
}
