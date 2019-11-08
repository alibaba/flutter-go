import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBoxs;

const Text = '''
### **简介**
> 操作图形的界面;

''';
const Text1 = '''
### **基本用法**
- canvas + Animation 实现一个 loading 效果;
''';

class Demo extends StatefulWidget {
  static const String routeName =
      '/element/Media/﻿Canvas/CircleProgressBarPainter';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CircleProgressBarPainter',
      codeUrl: 'elements/Media/Canvas/CircleProgressBarPainter/demo.dart',
      contentList: [Text, Text1, demoBoxs.CustomViewPage()],
      docUrl: 'https://docs.flutter.io/flutter/dart-ui/Canvas-class.html',
    );
  }
}
