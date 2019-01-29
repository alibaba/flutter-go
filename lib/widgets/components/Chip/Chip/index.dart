/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-18 11:40:57 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-18 15:13:23
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> chip是表示属性，文本，实体或动作的元素
- 需要在Material wedige 中。 
''';
const String content1 = '''
### **基本用法**
- 需要Material widget.
- 这个label和clipBehavior参数不能为空
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Chip/Chip';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
         ChipDemo(),
        ],
        codeUrl: 'components/Chip/Chip/demo.dart',
        docUrl:
            'https://docs.flutter.io/flutter/material/Chip-class.html',
        title: 'Chip');
  }
}
