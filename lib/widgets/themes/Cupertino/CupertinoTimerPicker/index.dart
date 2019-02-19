import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';

import 'demo.dart';

const Text0 = '''
### **简介**

> CupertinoTimerPicker 是一个ios风格下的时间选择组件

此选择器显示带有小时、分钟和秒的时间选择器。时间范围为0-23小时, 0-59分钟. 0-59秒.


### **基本用法**


### **基本实例**

属性说明: 

- initialTimerDuration 初始化时间点
- minuteInterval 分钟间隔, 我们设置为5, 则分钟选项为0,5,10,15...
- mode 显示的格式, 我们可以控制该属性, 仅显示小时与分钟, 分钟与秒等, 具体查看 **CupertinoTimerPickerMode**
- onTimerDurationChanged 时间改变后的回调
- secondInterval  秒数间隔, 与minuteInterval同

''';

class Demo extends StatefulWidget {
  static const String routeName =
      '/element/themes/Cupertino/CupertinoTimerPicker';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoTimerPicker',
      codeUrl: 'themes/Cupertino/CupertinoTimerPicker/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/cupertino/CupertinoTimerPicker-class.html',
      contentList: [Text0, CupertinoTimerPickerDemo()],
    );
  }
}
