/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午9:55
/// email: zhu.yan@alibaba-inc.com
/// target: BottomNavigationBarItem 的示例

import 'package:flutter_go/components/widget_demo.dart';

import 'package:flutter_web/material.dart';

import './demo.dart' as BottomNavigationBarItemDemo;

const String _Text0 =
"""### **简介**
> BottomNavigationBarItem “底部导航应用栏”
- material 的 BottomNavigationBar 或带有图标和标题的 iOS主题 CupertinoTabBar 中的交互式按钮;
""";

const String _Text1 =
"""### **基本用法**
> 这个类很少单独使用。通常嵌入在上面的一个底部 bottom navigation widgets 中;
""";

class Demo extends StatefulWidget {
  static const String routeName = '/components/Navigation/BottomNavigationBarItem';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'BottomNavigationBarItem',
      codeUrl: 'components/Navigation/BottomNavigationBarItem/demo.dart',
      contentList: allDomeBox(context, this),
      docUrl: 'https://docs.flutter.io/flutter/widgets/BottomNavigationBarItem-class.html',
    );
  }
}


// 所有的 BottomNavigationBarItem widget
// context: 运行上下文
// that: 指向有状态的 StatefulWidget
List allDomeBox(BuildContext context, _DemoState that) {
  return [
    _Text0,
    SizedBox(height: 20.0), // 间距
    _Text1,
    SizedBox(height: 20.0), // 间距
    BottomNavigationBarItemDemo.BottomNavigationBarItemLessDefault(),
    SizedBox(height: 20.0), // 间距
  ];
}



