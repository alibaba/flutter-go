/*
 * @Author: 一凨 
 * @Date: 2018-12-27 16:25:22 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-27 16:35:39
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 定义单色以及具有十种色调的色样
- 颜色的阴影由索引引用。指数越大，颜色越深。总共有十个有效指数：50、100、200、...、900.
''';

const String content1 = '''
### **基础用法**
> 这里我们配合Icon来进行演示
- 颜色的值应与指数500和shade500的值相同
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Material/MaterialColor';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        ColorDemo(),
      ],
      title: "MaterialColor",
      codeUrl: 'Material/MaterialColor/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/material/MaterialColor-class.html',
    );
  }
}
