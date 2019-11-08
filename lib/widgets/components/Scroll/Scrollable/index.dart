/// @Author: 一凨
/// @Date: 2018-12-10 21:31:24
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-15 17:05:20

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String contentText0 = '''
### **简介**
> 一个可以使内容滚动的Widget
- 实现了可滚动widget的交互模型，但不包含UI显示相关的逻辑
- 很难直接构造Scrollable。当然，我们可以考虑使用ListView或者GridView，他们结合了滚动、视口以及布局模型。如果需要自定义布局模型，可以考虑使用 CustomScrollView 。
''';

const String contentText1 = '''
### **基本用法**
- 静态方法 Scrollable.of 和 Scrollable.ensureVisible 通常用于ListView或者GridView中的Scrollable小部件进行交互
- 你可以提供自定义的ScrollController，以创建自定义ScrollPosition子类。
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/Scrollable';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'components/Scroll/Scrollable/demo.dart',
      contentList: [
        contentText0,
        contentText1,
        ScrollableDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/Scrollable-class.html',
      title: 'Scrollable',
    );
  }
}
