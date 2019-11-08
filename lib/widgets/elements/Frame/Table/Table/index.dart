import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './table_demo.dart';

const contentDesc0 = '''
### **简介**
> 一种布局方法
- 一个可以对齐子元素进行table 布局算法的Widget
''';
const contentDesc1 = '''
### **基本用法**
> 大多用于多行多列的需求
- 如果你只有一行或者一列，其实选择Row和Column更合适一些
- 表格中行的大小是根据列行数和宽度计算的来，控制列宽可以使用 columnWidth 属性
- 注意，Table中每一行的列数需要一致，否则报错
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Table/Table';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Table',
      codeUrl: 'elements/Frame/Table/Table/table_demo.dart',
      contentList: [
        contentDesc0,
        contentDesc1,
        TableDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/Table-class.html',
    );
  }
}
