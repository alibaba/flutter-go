import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';

import 'demo.dart';
const Text0 = '''
### **简介**
> ios风格下的Switch组件, 用法与Switch组件相同 

### **基本用法**

> 基本用法与Switch基本相同.  不同点在于, 该组件仅支持自定义activeColor, 也就是支持自定义当按钮处于true状态下,按钮的背景色.
''';


class Demo extends StatefulWidget {
  static const String routeName =
      '/element/themes/Cupertino/CupertinoSwitch';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoSlider',
      codeUrl: 'themes/Cupertino/CupertinoSwitch/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSwitch-class.html',
      contentList: [
        Text0,
        CupertinoSwitchDemo()
      ],
    );
  }
}
