/// @Author: 一凨 
/// @Date: 2018-12-22 21:01:45 
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-22 21:26:54

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 带有选中标记的 Material 设计风格的弹出菜单
- 默认高度为48px，水平布局使用 ListTile 复选标记是 Icons.done 图标，显示在 leading 位置
- 只有在状态为选中时才会显示图标
''';

const String content1 = '''
### **基本用法**
> 配合 PopupMenuButton 使用
- enabled 属性控制item是否为可点击
- checked 标识item是否为选中状态
''';

class Demo extends StatefulWidget {
   static const String routeName = '/components/Menu/CheckedPopupMenuItem';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'components/Menu/CheckedPopupMenuItem/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/material/CheckedPopupMenuItem-class.html',
      title: 'CheckedPopupMenuItem',
      contentList: [
        content0,
        content1,
        CheckedPopupMenuItemDemo(),
      ],
    );
  }
}