 /// @Author: 一凨 
 /// @Date: 2018-11-28 20:44:13 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2019-01-14 17:02:20

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './animatedPadding_demo.dart';

const contentDesc0 = '''
### **简介**
> 属于Flutter动画成员的一部分
''';

const contentDesc1 = '''
### **基本用法**
> 动画版本的Padding
- 在给定的时间内，自动完成转换缩进到给定的padding值
- 通过设置curve 来指定动画的运行速率动画
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/spacing/AnimatedPadding';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'AnimatedPadding',
      contentList: [
        contentDesc0,
        contentDesc1,
        AnimatedPaddingDemo(),
      ],
      docUrl:
          'https://docs.flutter.io/flutter/widgets/AnimatedPadding-class.html',
      codeUrl: 'elements/Frame/Spacing/AnimatedPadding/animatedPadding_demo.dart',
    );
  }
}
