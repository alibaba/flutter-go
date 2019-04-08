/// @Author: 一凨 
/// @Date: 2018-12-27 14:43:50 
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-27 15:44:31

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 一个提供菜单栏弹出对话框的按钮
- 点击的时候弹出菜单栏对话框，当选择其中一项后会调用 onSelected方法。传递其所选的菜单项的值
- 可以提供一个child widget或者提供一个icon给它，但是并不能两者都提供
- 如果什么都没有提供给 PopupMenuButton ，则会根据运行平台创建一个overflow icon

''';

const String content1 = '''
### **基本用法**
> PopupMenuButton 通常配合 PopupMenuItem 一起使用
- enabled 标识当前item是否可点击
- PopupMenuItem 可以在child中传入带有Icon的widget
- 可以指定 PopupMenuButton 的 初始值 initialValue
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Menu/PopupMenuButton';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        PopupMenuButtonDemo(),
      ],
      codeUrl: 'components/Menu/PopupMenuButton/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/material/PopupMenuButton-class.html',
      title: 'PopupMenuButton',
    );
  }
}