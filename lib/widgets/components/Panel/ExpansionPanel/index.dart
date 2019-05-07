/// @Author: xiaojia.dxj
/// @Date: 2018-12-21 11:35:39 
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-21 11:36:23

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 扩展面板，包含一个标题和一个正文，可以展开或者折叠。面板展开，主体可见。

 
''';
const String content1 = '''
### **基本用法**

''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Panel/ExpansionPanel';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
          ExpansionPanelsDemo(),
        ],
        codeUrl: 'widgets/components/Panel/ExpansionPanel/demo.dart',
        docUrl:'https://docs.flutter.io/flutter/material/RawChip-class.html',
        title: 'ExpansionPanel');
  }
}
