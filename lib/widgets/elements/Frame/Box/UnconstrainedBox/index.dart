/*
 * @Author: xiaojia.dxj
 * @Date: 2019-01-08 15:57:00 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2019-01-08 16:00:14
 */
import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart';

const String Text0 = """### **简介**
> 跟ConstrainedBox相反，是不添加任何约束条件到child上，让child按照其原始的尺寸渲染
- 它的作用就是给child一个尽可能大的空间，不加约束的让其显示。
""";

const String Text1 = """
### **基本用法**
mainAxisSize 属性
- 一行的高度是有mainAxisSize属性控制，默认是max

mainAxisAlignment属性
- 将children放置在主轴某位置

CrossAxisAlignment 属性
- crossAxisAlignment: crossAxisAlignment.center/end/start,
- 即，根据设定的位置交叉对齐
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/UnconstrainedBox';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'UnconstrainedBox',
      // desc: 'Layout-Row 使用',
      codeUrl: 'elements/Frame/Box/UnconstrainedBox/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/widgets/UnconstrainedBox-class.html',
      contentList: [
        Text0,
        UnconstrainedBoxDemo(),
      ],
    );
  }
}
