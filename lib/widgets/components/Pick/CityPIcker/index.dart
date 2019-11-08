/// Created with Android Studio.
/// User: 三帆
/// Date: 05/02/2019
/// Time: 22:06
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 显示中国的省市县地区
通过函数 **showCityPicker** 调用, 在容器窗口上弹出遮罩层
''';
const String content1 = '''
### **基本用法**
- locationCode 初始化地区选择
- height 弹出层高度
- context 上下文对象
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Pick/CityPicker';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CityPicker',
      codeUrl: '',
      docUrl: '',
      contentList: [content0, content1, CityPickerDemo()],
    );
  }
}
