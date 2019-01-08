/*
 * @Author: 一凨 
 * @Date: 2018-12-15 20:39:18 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-15 21:26:11
 */
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart';

const  String content0 = '''
### **简介**
> 确定滚动组件的物理属性
- 例如，确定当用户达到最大滚动范围或者停止滚动时，Scrollable的一些滚动行为
- 当启动物理 [Simulation](https://docs.flutter.io/flutter/physics/Simulation-class.html) 时，当前滚动位置和速度将作为初始条件。
- 使用simulation中的模拟移动来确定widget的滚动位置
''';
const  String content1 = '''
### **基本用法**
> 该widget不能赋值给参数类型为Widget的组件
- 下方Demo，我们设置PageView的physics属性，滑动感受下下方小字自定义的滚动
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/ScrollPhysics';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        ScrollPhysicsDemo(),
      ],
      codeUrl: 'components/Scroll/ScrollPhysics/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/ScrollPhysics-class.html',
      title: 'ScrollPhysics',
    );
  }
}
