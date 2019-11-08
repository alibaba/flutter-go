import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBoxs;

const Text = '''
### **简介**
> 用于操作图形的界面;
- canvas 对象用于创建图片对象，这些对象本身可以与 SceneBuilder 一起用于构建场景;
''';
const Text1 = '''
### **基本用法**
- 以下是绘制点，线，面的基本用法
''';

const Text2 = '''
> 绘制点
- 绘制点有三种模式, points（点），lines（线，隔点连接），polygon（线，相邻连接）
''';

const Text3 = '''
> 绘制直线
''';

const Text4 = '''
> 绘制圆
''';

const Text5 = '''
> 绘制椭圆
- 使用左上和右下角坐标来确定矩形的大小和位置,椭圆是在这个矩形之中内切的形状
''';

const Text6 = '''
> 绘制圆弧
- Rect 来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及 paint 弧度
''';

const Text7 = '''
> 绘制矩形，圆角矩形
- 用 Rect构建矩形
- 根据上面的矩形,构建一个圆角矩形
''';

const Text8 = '''
> 绘制两个相套矩形
''';

const Text9 = '''
> 绘制图片到canvas
''';

const Text10 = '''
> 绘制一个星形
- 它可以使用“平移”、“缩放”、“旋转”、“倾斜”和“变换”方法进行修改;
- 可以使用 clipRect、clipCorrect 和 clipPath 方法进行修改;
- 可以使用由 save、savelayer和 restore 方法管理的堆栈来保存和还原当前的转换和剪辑。
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/﻿Canvas/﻿Canvas';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Canvas',
      codeUrl: 'elements/Media/Canvas/Canvas/demo.dart',
      contentList: [
        Text,
        Text1,
        Text2,
        demoBoxs.CustomViewPage(type: 'drawPoints'),
        Text3,
        demoBoxs.CustomViewPage(type: 'drawLine'),
        Text4,
        demoBoxs.CustomViewPage(type: 'rawCircle'),
        Text5,
        demoBoxs.CustomViewPage(type: 'drawOval'),
        Text6,
        demoBoxs.CustomViewPage(type: 'drawArc'),
        Text7,
        demoBoxs.CustomViewPage(type: 'drawRRect'),
        Text8,
        demoBoxs.CustomViewPage(type: 'drawDRRect'),
        Text9,
        demoBoxs.CustomViewPage(type: 'drawImage'),
        Text10,
        demoBoxs.CustomViewPage(type: 'drawStar'),
      ],
      docUrl: 'https://docs.flutter.io/flutter/dart-ui/Canvas-class.html',
    );
  }
}
