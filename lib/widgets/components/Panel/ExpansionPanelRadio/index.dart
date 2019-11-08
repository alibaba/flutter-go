/// @Author: xiaojia.dxj
/// @Date: 2018-12-20 20:30:41
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-21 11:35:48

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';

const String content0 = '''
### **简介**
> 所有chip widget类型的基础，集合所有功能，我们通常不是直接使用它，而是根据自己需要选择chi， 比如：
- chip ,一个简单的芯片，只能显示信息，并被删除
- inputChip,以紧凑的形式表现复杂的信息，例如：实体（人，地点，或者事物）或者会话文本
- choiceChip,允许从一组选项中进行单一的选择
- FilterChip,使用标签或描述作为过滤内容的方式

 
''';
const String content1 = '''
### **基本用法**
- inputChip可以通过设置进行选择onSelected，通过设置onDeleted可以删除，并且可以通过OnPressed表现按压效果
- inputChip 有一个前导图标和尾随图标，填充颜色可以订制
- inputChip 可以和其他UI元素搭配使用，比如：wrap,ListView(scrollDirection为Axis.horizo​​ntal)
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Chip/RawChip';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
          // FilterChipDemo(),
        ],
        codeUrl: 'components/Chip/RawChip/demo.dart',
        docUrl: 'https://docs.flutter.io/flutter/material/RawChip-class.html',
        title: 'RawChip');
  }
}
