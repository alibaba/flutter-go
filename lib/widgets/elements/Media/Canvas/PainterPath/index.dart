import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBoxs;

//const Text = '''
//### **简介**
//> 在 canvas 上绘制时使用的样式说明;
//-  canvas 上的大多数API都使用一个绘画对象来描述用于该操作的样式。
//''';
const Text = '''
### **简介**
> 在 canvas 上绘制的图案;
-  canvas + paint 的应用。
''';

const Text1 = '''
### **基本用法**
- canvas 的 painter 的自定义绘制线的方法;
''';

const Text2 = '''
> 绘制简单直线
''';

const Text3 = '''
> 绘制折线
''';

const Text4 = '''
> 二阶贝塞尔曲线
''';

const Text5 = '''
> 三阶贝塞尔曲线
''';


class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/﻿Canvas/PainterPath';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'PainterPath',
      codeUrl: 'elements/Media/Canvas/PainterPath/demo.dart',
      contentList: [
        Text,
        Text1,
        Text2,
        demoBoxs.CustomViewPage(type:'simpleline'),
        Text3,
        demoBoxs.CustomViewPage(type:'polyline'),
        Text4,
        demoBoxs.CustomViewPage(type:'Besizerline2'),
        Text5,
        demoBoxs.CustomViewPage(type:'Besizerline3'),
      ],
      docUrl: 'https://docs.flutter.io/flutter/dart-ui/Paint-class.html',
    );
  }
}
