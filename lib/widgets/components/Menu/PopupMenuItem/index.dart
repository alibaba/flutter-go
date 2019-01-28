/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-29 15:04:51 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-29 15:07:16
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import '../PopupMenuDivider/demo.dart';

const String content0 = '''
### **简介**
> Material 中窗口弹出的菜单
- 如果需要创建一个显示弹出菜单的按钮，请考虑使用 PopupMenuButton.
''';

const String content1 = '''
### **基本用法**
- PopupMenuDivider 是一条水平分割线，注意数组要使用父类 PopupMenuEntry，配合其他 item 样式共同使用
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Menu/PopupMenuItem';
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
      docUrl: "https://docs.flutter.io/flutter/material/PopupMenuItem-class.html",
      codeUrl: 'components/Menu/PopupMenuEntry/demo.dart',
      title: 'PopupMenuItem',
    );
  }
}