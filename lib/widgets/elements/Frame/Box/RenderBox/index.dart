/*
 * @Author: xiaojia.dxj
 * @Date: 2019-01-08 15:56:26 
 * @Last Modified by:   xiaojia.dxj
 * @Last Modified time: 2019-01-08 15:56:26 
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';

const String _Text = '''
### **简介**
> BoxConstraints为抽象类，我们可以使用BoxConstraints,一个不可边的约束布局，renderBox布局
- 一个尺寸尊重一个BoxConstraints，当且仅当，以下关系式的成立：
minWidth <= Size.width <= maxWidth
minHeight <= Size.height <= maxHeight
约束本身必须满足这些关系：

0.0 <= minWidth <= maxWidth <= double.infinity
0.0 <= minHeight <= maxHeight <= double.infinity
double.infinity是每个约束的合法值。
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/RenderBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Table',
      codeUrl: 'elements/Frame/Box/RenderBox/demo.dart',
      contentList: [
        _Text,
        _sizeBoxCreate(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/RenderBox-class.html',
    );
  }

  Column _sizeBoxCreate() {
    return new Column(
      children: <Widget>[
        /**
         * Immutable layout constraints for RenderBox layout.
         */
        SizedBox(
          width: 900.0,
          height: 50.0,
          child: const Card(
              child: Text(
                'SizedBox',
                textAlign: TextAlign.center,
              ),
              color: Color(0xFFEF5350)),
        ),
      ],
    );
  }
}
