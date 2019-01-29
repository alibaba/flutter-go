/*
 * @Author: 一凨 
 * @Date: 2018-12-15 19:44:12 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-15 20:33:47
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 包含当前ViewPort及滚动位置等信息
- pixels：当前滚动位置
- maxScrollExtent：最大可滚动长度。
- extentBefore：滑出ViewPort顶部的长度；
- extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度
- extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度
- atEdge：是否滑到了Scrollable Widget的边界
''';

const String content1 = '''
### **基本用法**
> 抽象类，不可被实例化
- FixedScrollMetrics，它是实现此接口的不可变对象
- 下方Demo中，在接收到滚动事件时，参数类型为ScrollNotification，它包括一个metrics属性，它的类型是ScrollMetrics
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/ScrollMetrics';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'ScrollMetrics',
      docUrl: 'https://docs.flutter.io/flutter/widgets/ScrollMetrics-class.html',
      codeUrl: 'components/Scroll/ScrollMetrics/demo.dart',
      contentList: [
        content0,
        content1,
        ScrollMetricsDemo(),
      ],
    );
  }
}