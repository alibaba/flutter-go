/*
 * @Author: 一凨 
 * @Date: 2018-12-27 14:51:58 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-27 15:55:22
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 一个提供菜单栏弹出对话框中每一项的水平线
- 配合 PopupMenuItem 和 PopupMenuButton 使用
- PopupMenuDivider 可以调整高度，但无法调整颜色
''';

const String content1 = '''
### **基本用法**
> 此widget通过调整Divider widget 来适应于弹出菜单中
- 在 PopupMenuButton 中直接 new PopupMenuDivider() 即可
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Menu/PopupMenuDivider';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        PopupMenuDividerDemo(),
      ],
      codeUrl: 'components/Menu/PopupMenuDivider/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/material/PopupMenuDivider-class.html',
      title: 'PopupMenuDivider',
    );
  }
}
