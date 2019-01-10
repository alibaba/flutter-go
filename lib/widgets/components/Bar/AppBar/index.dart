/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午7:30
 * email: zhu.yan@alibaba-inc.com
 * tartget: AppBar 的示例
 */
import '../../../../common/widget_demo.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as AppBarDemo;

const String _Text0 =
"""### **简介**
> AppBar “应用栏”
- 应用栏由工具栏和可能的其他 widget 组成，例如 TabBar和FlexibleSpaceBar。
- 应用栏通常用于 Scaffold.appBa r属性，该属性将应用栏放置在屏幕顶部的固定高度小部件中。
- 对于可滚动的应用栏，请参阅SliverAppBar，它将AppBar嵌入 sliver 中以便在CustomScrollView中使用。
""";


const String _Text1 =
"""### **基本用法**
> AppBar
- AppBar 在底部上方显示工具栏 widget，前导 leading ，标题 title 和操作 actions。
""";

const String _Text2 =
"""### **进阶用法**
> AppBar
- 一个完整的 AppBar 的例子, 增加 PopupMenuButton,TabBar 的示例子。
- 所述底部通常用于一个的TabBar。如果指定了flexibleSpace窗口小部件，则它将堆叠在工具栏和底部窗口 widget 后面。
""";

class Demo extends StatefulWidget {
  static const String routeName = '/components/Bar/AppBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'AppBar',
      codeUrl: 'componentss/Bar/AppBar/demo.dart',
      contentList: [ allDemoBoxs(context, this) ],
      docUrl: 'https://docs.flutter.io/flutter/material/AppBar-class.html',
    );
  }
}

/**
 * 所有的 AppBar widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allDemoBoxs(BuildContext context, _DemoState that) {
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _Text0),
            SizedBox(height: 20.0), // 间距
            MarkdownBody(data: _Text1),
            SizedBox(height: 20.0), // 间距
            AppBarDemo.AppBarLessDefaultSimple(),
            SizedBox(height: 20.0), // 间距
            MarkdownBody(data: _Text2),
            SizedBox(height: 20.0), // 间距
            AppBarDemo.AppBarLessDefaultComplex(),
            SizedBox(height: 20.0), // 间距
          ])
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt) {
  return new Align(
      alignment: FractionalOffset.centerLeft,
      child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            MarkdownBody(data: txt)
          ])
  );
}


