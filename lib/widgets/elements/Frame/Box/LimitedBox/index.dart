/*
 * @Author: xiaojia.dxj
 * @Date: 2019-01-08 15:56:35 
 * @Last Modified by:   xiaojia.dxj
 * @Last Modified time: 2019-01-08 15:56:35 
 */
import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart';

const String Text0 = """
### **LimitedBox**
> 对最大宽高进行限制的控件
- 即：将child限制在指定的最大宽高中，如果LimitedBox外部没有约束，那么最大宽高不受限制，child的宽高受到LimitedBox最大宽高限制
""";

const String Text1 = """
### **基本用法**
> widget 限制child最大宽高，如下：
- maxHeight限制最大高度
- maxWidth限制最大宽


""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/LimitedBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'LimitedBox',
      codeUrl: 'elements/Frame/Box/LimitedBox/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/LimitedBox-class.html',
      contentList: [
        Text0,
        Text1,
        LimitedBoxDemo(),
      ],
    );
  }
}
