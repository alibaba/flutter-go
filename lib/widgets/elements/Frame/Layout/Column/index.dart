import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart';

const String Text0 = """### **简介**
> Column 是一个将其孩子显示在竖直方向数组的widget，于Row相对
- 将其孩子填充可用的竖直水平空间，默认竖直空间无法滚动，如有很多children，竖直空间饱和无法放置，你可以使用listView搭配使用
- 如果你只有一个child，只需要使用对齐（Align）或者居中（Center）来展示child
""";

const String Text1 = """
### **基本用法**
> 竖直布局，设置位置对齐方式

mainAxisSize 属性
- 一行的高度是有mainAxisSize属性控制，默认是max

mainAxisAlignment属性
- 将children放置在主轴某位置

CrossAxisAlignment 属性
- crossAxisAlignment: crossAxisAlignment.center/end/start,
- 即，根据设定的位置交叉对齐
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Layout/Column';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Column',
      codeUrl: 'elements/Frame/Layout/Column/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/Column-class.html',
      contentList: [
        Text0,
        Text1,
        ColumnDefault(),
      ],
    );
  }
}
