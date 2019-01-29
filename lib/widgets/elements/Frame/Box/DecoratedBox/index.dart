/*
 * @Author: xiaojia.dxj
 * @Date: 2019-01-08 15:56:49 
 * @Last Modified by:   xiaojia.dxj
 * @Last Modified time: 2019-01-08 15:56:49 
 */
import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart';

const String _Text = """### **简介**
> 在child绘制前或绘制后，添加额外的限制条件到child上的widget
- 根据边界的宽高，对其child进行插入绘制
""";

const String _Text1 = """### **基本用法**
> decoration → Decoration
- 常用于BoxDecoration
- BoxDecoration提供多种方式来绘制以一个框
- 盒子形状可以是圆形也可以是矩形，用borderRadius属性来绘制角度

> position → DecorationPosition
- position: DecorationPosition.foreground,
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'DecoratedBox',
      codeUrl: 'elements/Frame/Box/DecoratedBox/demo.dart',
      contentList: [
        _Text,
        _Text1,
        _decoratedBoxCreate(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/DecoratedBox-class.html',
    );
  }

  Column _decoratedBoxCreate() {
    return new Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          child: DecoratedBoxCreate(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 100.0,
          width: 100.0,
          child: DecoratedBoxCreateTwo(),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 100.0,
          width: 100.0,
          child: DecoratedBoxCreateShape(),
        )
      ],
    );
  }
}
