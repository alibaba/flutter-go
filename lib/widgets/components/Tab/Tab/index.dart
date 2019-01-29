/*
 * @Author: 一凨 
 * @Date: 2018-12-22 20:37:58 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-22 20:49:56
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 属于 Material 风格下的一个widget
- 如果同时给Tab传入icon和text，text将会被展现在icon的下面
''';

const String content1 = '''
### **基本用法**
> 通常需要配合TabBar TabBarView使用
- TabBar中的children和TabBarView中的数组成一一对应关系
- TabController 可以协调TabBarView和Tab之间的选择和个数等
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Tab/Tab';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'components/Tab/Tab/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/material/Tab-class.html',
      title: 'Tab',
      contentList: [
        content0,
        content1,
        TabDemo(),
      ],
    );
  }
}