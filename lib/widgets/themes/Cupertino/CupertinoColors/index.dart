/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/1/20
 * Time: 下午10:57
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoButton 的示例
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart' as demoBox;

const String content0 = '''
### **简介**
> iOS平台常用的颜色
''';

const String content1 = '''
### **基本用法**
> CupertinoColors 的一个是示例
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoApp';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoColorsFullDefault()
      ],
      title: 'CupertinoApp',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoColors-class.html',
      codeUrl: '/themes/Cupertino/CupertinoColor/demo.dart',
    );
  }
}