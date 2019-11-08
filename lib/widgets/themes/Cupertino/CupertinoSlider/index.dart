import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const Text0 = '''
### **简介**
> 用来选择范围性的数据

CupertinoSlider 是ios风格的Slide组件,用来选择连续性的或者非连续性的数据. 默认是在一段最大值最小值间做任意值的选择. 如果你想选择间隔性的值, 例如0.0到50.0间,选择10, 15,...50.0这样的值, 给divisions设定一个非空的整数5,, 去分割区间范围.

### **基本用法**

> 与 Slider 相同, 具体查看Slider组件
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/themes/Cupertino/CupertinoSlider';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoSlider',
      codeUrl: 'themes/Cupertino/CupertinoSlider/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/cupertino/CupertinoSlider-class.html',
      contentList: [
        Text0,
        CupertinoSliderDemo(),
        SizedBox(height: 100),
      ],
    );
  }
}
