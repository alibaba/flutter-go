/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:26
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> GridTile 是GridList中的一种瓷片组件;包含header, body, footer三部份;


### **基本用法**

> 一个grid列表包含多个Item, 每个Item通常包含一些视觉丰富的内容(例如，图像), 我们可以用GridTileBar去定义他的页眉与页脚。

如下实例中, 第一个是item便是GridTile组件构成. 包含header, body, footer;
""";



class Demo extends StatefulWidget {
  static const String routeName = '/components/Grid/GridTile';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'GridTile',
      codeUrl: 'components/Grid/GridTile/demo.dart',
      contentList: [
        _Text0,
        GridTileDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/Dialog-class.html',
    );
  }
}
