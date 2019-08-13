/// @Author: xiaojia.dxj
/// @Date: 2018-12-20 13:32:15 
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-21 10:42:05

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 输入型chip
- 以紧凑的形式表现复杂的信息，例如：实体（人，地点，或者事物）或者会话文本
 
''';
const String content1 = '''
### **基本用法**
- inputChip可以通过设置进行选择onSelected，通过设置onDeleted可以删除，并且可以通过OnPressed表现按压效果
- inputChip 有一个前导图标和尾随图标，填充颜色可以订制
- inputChip 可以和其他UI元素搭配使用，比如：wrap,ListView(scrollDirection为Axis.horizo​​ntal)
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Chip/InputChip';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
          FilterChipDemo(),
        ],
        codeUrl: 'components/Chip/FilterChip/demo.dart',
        docUrl:'https://docs.flutter.io/flutter/material/InputChip-class.html',
        title: 'InputChip');
  }
}
