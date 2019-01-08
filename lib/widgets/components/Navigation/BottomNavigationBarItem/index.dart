/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午9:55
 * email: zhu.yan@alibaba-inc.com
 * tartget: BottomNavigationBarItem 的示例
 */
import '../../../../common/widget-demo.dart';
import '../../../../routers/application.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as BottomNavigationBarItemDemo;

const String _Text0 =
"""### **简介**
> BottomNavigationBarItem “底部导航应用栏”
- material 的 BottomNavigationBar 或带有图标和标题的 iOS主题 CupertinoTabBar 中的交互式按钮。
""";


const String _Text1 =
"""### **基本用法**
> 这个类很少单独使用。通常嵌入在上面的一个底部 bottom navigation widgets 中。
""";

const String _Text2 =
"""### **进阶用法**
> BottomNavigationBarItem
- 
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
      codeUrl: '${Application.github['widgetsURL']}componentss/Bar/BottomNavigationBarItem/demo.dart',
      child: allCheckboxs(context, this),
      docUrl: 'https://docs.flutter.io/flutter/widgets/BottomNavigationBarItem-class.html',
    );
  }
}

/**
 * 所有的 BottomNavigationBarItem widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allCheckboxs(BuildContext context, _DemoState that) {
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _Text0),
            SizedBox(height: 20.0), // 间距
            MarkdownBody(data: _Text1),
            SizedBox(height: 20.0), // 间距
            BottomNavigationBarItemDemo.BottomNavigationBarItemLessDefault(),
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


