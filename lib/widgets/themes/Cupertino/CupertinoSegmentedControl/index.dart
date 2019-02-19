import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const Text0 = '''
### **简介**
> IOS风格下用于展示一些用户可以选择的选项

将来自CupertinoSegmentedControl的child属性的Map列表中的组件, 以水平的方式展开供用户选择.这些选择是互斥的. 用户只能选择一个.


### **基本用法**

> 这个组件的重点属性在于他的child属性

在官方文档中, 它的child属性是一个Map<T,Widget>对象. 这个对象的K可以是任意对象, String/Int/Widget/Array..., 这里的T值会在每次用户点击的时候. 触发**onValueChanged<T>** 回调,
整个组件的高度, 取决于Map列表中Widget中最高的. 整个组件的宽度, 取决于Map列表中widget中最宽的 * Map的长度.

样式支持用户自定义.
''';


class Demo extends StatefulWidget {
  static const String routeName =
      '/element/themes/Cupertino/CupertinoSegmentedControl';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoSegmentedControl',
      codeUrl: '/hemes/Cupertino/CupertinoSegmentedControl/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSegmentedControl-class.html',
      contentList: [
        Text0,
        CupertinoSegmentedControlDemo(),
        SizedBox(height: 100),
      ],
    );
  }
}
