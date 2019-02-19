/// @Author: xiaojia.dxj
/// @Date: 2018-12-19 15:13:29 
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-21 10:22:57

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 允许从一组选项中进行单一的选择
- ChoiceChip包含相关的描述性文本或者类别

''';
const String content1 = '''
### **基本用法**
- onSelected : 选择或者取消选择状态间切换调用
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Chip/ChoiceChip';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
         ChoiceChipDemo(),
        ],
        codeUrl: 'components/Chip/ChoiceChip/demo.dart',
        docUrl:'https://docs.flutter.io/flutter/material/ChoiceChip-class.html',
        title: 'ChoiceChip');
  }
}
