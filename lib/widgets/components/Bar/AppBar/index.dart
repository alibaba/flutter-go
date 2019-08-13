/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午7:30
/// email: zhu.yan@alibaba-inc.com
/// target: AppBar 的示例

import 'package:flutter_web/material.dart';

import './demo.dart' as AppBarDemo;
import 'package:flutter_go/components/widget_demo.dart';

const String _Text0 =
"""### **简介**
> AppBar “应用栏”
- 应用栏由工具栏组成，或者是工具栏和其他 widget 组合形成，例如 TabBar和FlexibleSpaceBar;
- 应用栏通常用于 Scaffold.appBar 属性，该属性将应用栏放置在屏幕顶部的固定高度小部件中;
- 对于可滚动的应用栏，请参阅SliverAppBar，它将AppBar嵌入 sliver 中以便在CustomScrollView中使用;
""";


const String _Text1 =
"""### **基本用法**
> AppBar
- AppBar 在底部上方显示工具栏 widget，前导 leading ，标题 title 和操作 actions;
""";

const String _Text2 =
"""### **进阶用法**
> AppBar
- 一个完整的 AppBar 的例子, 增加 PopupMenuButton,TabBar 的示例子;
- 所述底部通常用于一个的 TabBar;
- 如果指定了 flexibleSpace 窗口 widget，则它将堆叠在工具栏和底部窗口 widget 后面;
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
      codeUrl: 'components/Bar/AppBar/demo.dart',
      contentList: allDomes(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/AppBar-class.html',
    );
  }
}

//  所有的 AppBar widget
//  context: 运行上下文
//  that: 指向有状态的 StatefulWidget
List allDomes(BuildContext context, _DemoState that) {
  return [
    _Text0,
    SizedBox(height: 20.0), // 间距
    _Text1,
    SizedBox(height: 20.0), // 间距
    AppBarDemo.AppBarLessDefaultSimple(),
    SizedBox(height: 20.0), // 间距
    _Text2,
    SizedBox(height: 20.0), // 间距
    AppBarDemo.AppBarLessDefaultComplex(),
    SizedBox(height: 20.0), // 间距
  ];
}
