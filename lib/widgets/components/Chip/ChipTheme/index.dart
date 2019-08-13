/// @Author: xiaojia.dxj
/// @Date: 2018-12-18 15:14:03 
/// @Last Modified by:   xiaojia.dxj
/// @Last Modified time: 2018-12-18 15:14:03 

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 基于 RawChip-based widgets，如chip，inputChip,ChoiceChip,FilterChip等
- chipTheme描述了应用它的chip的颜色，形状和文本样式
 
''';
const String content1 = '''
### **基本用法**
- 可通过chipTheme.of获取当前主题的ChipThemeData对象
- 当widget使用ChipTheme.of时，如果主题稍后更改，则会自动重建。
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Chip/ChipTheme';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
         ChipThemeDemo(),
        ],
        codeUrl: 'components/Chip/ChipTheme/demo.dart',
        docUrl:
            'https://docs.flutter.io/flutter/material/ChipTheme-class.html',
        title: 'ChipTheme');
  }
}
