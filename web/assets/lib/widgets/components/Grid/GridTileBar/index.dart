/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:26
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> GridTileBar 通常用来做GridTile的header与footer组件;


### **基本用法**

> GridTileBar含有五个属性

- backgroundColor 描述GridTileBar的背景颜色
- leading GridTileBar左侧的widget, 通常我们用图标来占位
- subtitle 次标题
- title 主标题
- trailing GridTileBar右侧的widgett, 通常我们用来做交互操作类的组件
""";



class Demo extends StatefulWidget {
  static const String routeName = '/components/Grid/GridTileBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'GridTileBar',
      codeUrl: 'components/Grid/GridTileBar/demo.dart',
      contentList: [
        _Text0,
        GridTileDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/GridTileBar-class.html',
    );
  }
}
