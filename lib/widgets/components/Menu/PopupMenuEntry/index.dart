/// @Author: 一凨 
/// @Date: 2018-12-27 14:51:58 
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-27 16:06:20

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import '../PopupMenuDivider/demo.dart';

const String content0 = '''
### **简介**
> Material 风格中 弹出菜单的一个基类
- 如果需要创建一个显示弹出菜单的按钮，请考虑使用 PopupMenuButton.
''';

const String content1 = '''
### **基本用法**
- PopupMenuDivider 是一条水平分割线，注意数组要使用父类 PopupMenuEntry，配合其他 item 样式共同使用
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Menu/PopupMenuEntry';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        PopupMenuDividerDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/PopupMenuEntry-class.html',
      codeUrl: 'components/Menu/PopupMenuDivider/demo.dart',
      title: 'PopupMenuEntry',
    );
  }
}