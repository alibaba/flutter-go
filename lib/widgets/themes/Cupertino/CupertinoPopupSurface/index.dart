/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/1/20
 * Time: 下午10:57
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoPopupSurface 的示例
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart' as demoBox;

const String content0 = '''
### **简介**
> 像iOS弹出式表面
- 快速实现一个圆角弹框,类似 alert dialog 和 sheet;
''';

const String content1 = '''
### **基本用法**
> CupertinoPopupSurface 的一个示例
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoPopupSurface';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoPopupSurfaceFullDefault(),
        SizedBox(height:50)
      ],
      title: 'CupertinoPopupSurface',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoPopupSurface-class.html',
      codeUrl: '/themes/Cupertino/CupertinoPopupSurface/demo.dart',
    );
  }
}