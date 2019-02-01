import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBoxs;

const Text = '''
### **简介**
> 操作图形的界面;

''';
const Text1 = '''
### **基本用法**
- canvas + paint + GestureDetector 实现一个 简易的画板;
''';


class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/﻿Canvas/PainterSketch';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: '﻿Canvas',
      codeUrl: 'elements/Media/Canvas/PainterSketch/demo.dart',
      contentList: [
        Text,
        Text1,
        demoBoxs.PainterSketchDome()
      ],
      docUrl: 'https://docs.flutter.io/flutter/dart-ui/Paint-class.html',
    );
  }
}

