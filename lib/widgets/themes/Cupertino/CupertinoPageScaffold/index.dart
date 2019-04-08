/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 下午10:57
/// email: zhu.yan@alibaba-inc.com
/// target: CupertinoPageScaffold 的示例

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBox;

const String content0 = '''
### **简介**
> 实现单个 iOS 应用程序页的页面布局
- 一个 CupertinoPage 重要布局;
- 脚手架在顶部设置导航栏，在导航栏之间或之后设置内容;
''';

const String content1 = '''
### **基本用法**
> CupertinoPageScaffold 的一个示例
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoPageScaffold';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoPageScaffoldFullDefault(),
        SizedBox(height:50)
      ],
      title: 'CupertinoPageScaffold',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoPageScaffold-class.html',
      codeUrl: 'themes/Cupertino/CupertinoPageScaffold/demo.dart',
    );
  }
}