/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午8:53
/// email: zhu.yan@alibaba-inc.com
/// target: BottomAppBar 的示例

import 'package:flutter_go/components/widget_demo.dart';

import 'package:flutter_web/material.dart';

import './demo.dart' as BottomAppBarDemo;

const String _Text0 =
"""### **简介**
> BottomAppBar “底部应用栏”
- 一个通常与 Scaffold.bottomNavigationBar 一起使用的容器，可以在顶部有一个凹口，为重叠的FloatingActionButton腾出空间;
""";


const String _Text1 =
"""### **基本用法**
> 通常与 Scaffold 和 FloatingActionButton 一起使用;
""";


class Demo extends StatefulWidget {
  static const String routeName = '/components//Bar/BottomAppBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'BottomAppBar',
      codeUrl: 'components/Bar/BottomAppBar/demo.dart',
      contentList: allDomes(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/BottomAppBar-class.html',
    );
  }
}

//  所有的 BottomAppBar widget
//  context: 运行上下文
//  that: 指向有状态的 StatefulWidget
List allDomes(BuildContext context, _DemoState that) {
  return [
    _Text0,
    SizedBox(height: 20.0), // 间距
    _Text1,
    SizedBox(height: 20.0), // 间距
    BottomAppBarDemo.AppBarLessDefaultSimple(),
    SizedBox(height: 20.0), // 间距
  ];
}



