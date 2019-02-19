import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './expanded_demo.dart';

const contentText0 = '''
### **简介**
> 一个用于撑开 flex 布局子组件空间的widget
- 用于在Row、Column、Flex子组件内
- 会沾满所有可用空间
''';

const contentText1 = '''
### **基本用法**
> 以下示例对比使用 ```Expanded```
- 使用Expanded 可以使 Row、Column或者Flex的子项能够填充主轴的全部可用空间
- 如果存在多个子项，则根据 flex 属性来划分可用空间
- Expanded widget 必须是Row,Column或者Flex的后代
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Expanded/Expanded';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Expanded',
      codeUrl: 'elements/Frame/Expanded/Expanded/expanded_demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/Expanded-class.html',
      contentList: [
        contentText0,
        contentText1,
        ExpandedDemo(),
      ],
    );
  }
}
