/// @Author: 一凨
/// @Date: 2018-12-15 16:25:36
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-15 19:38:18

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String contentText0 = '''
### **简介**
> 用于绘制滚动条的CustomPainter。
- 与CustomPainter子类化的CustomPainters不同，只有当shouldRepaint返回true时才重绘
- 当滚动条消失和滚动位置发生变化的时候painter需要重绘而不是重新构建
''';

const String contentText1 = '''
### **基本使用**
> 当ScrollbarPainter不再使用的时候，必须在ScrollbarPainter上调用dispose
- 除非自定制Scrollbar的需求，基本上我们都可以使用Scrollbar
- Scrollbar的源码其实就是基于ScrollbarPainter封装的
- demo中将Scrollbar源码进行提取使用
- CupertinoScrollbar 同样也是使用ScrollbarPainter的最好学习示例
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/ScrollbarPainter';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'components/Scroll/ScrollbarPainter/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/widgets/ScrollbarPainter-class.html',
      contentList: [
        contentText0,
        contentText1,
        PaintDemo(),
      ],
      title: 'ScrollbarPainter',
    );
  }
}
