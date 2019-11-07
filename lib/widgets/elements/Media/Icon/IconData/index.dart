import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const Text = '''
### **简介**
> 字体表示符合表示的图标说明
- 可参考图标
''';

const Text1 = '''
### **基本用法**
- 多用于图标的使用选择 
- 可对图标设置大小， 颜色， 标签等
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Icon/IconData';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'IconData',
      codeUrl: 'elements/Media/Icon/IconData/demo.dart',
      contentList: [
        Text,
        Text1,
        _IconDataLayout(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/IconData-class.html',
    );
  }
}

class _IconDataLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconDataDemo(
          curColor: Colors.redAccent,
        ),
        IconDataDemo(
          curColor: Colors.yellow,
        )
      ],
    );
  }
}
