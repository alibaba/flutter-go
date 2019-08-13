
 /// Author: xiaojia.dxj
 /// Date: 2019-01-08 15:56:13 
 /// Email: xiaojia.dxj@alibaba-inc.com
 /// Last Modified by:   xiaojia.dxj
 /// Last Modified time: 2019-01-08 15:56:13 

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String _Text = '''
### **简介**
> 可以将子widget旋转整数的四分之一
 - 和Transform不同，该对象在布局之前应用其旋转，整个旋转的范围仅消耗旋转的子widget所需要的空间
''';

const String _Text1 = '''
### **基本用法**
> 旋转widget
- 通过quarterTurns，设置child的顺时针四分之一的转数
- ex:quarterTurns=3/8
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/RotatedBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        title: 'RotatedBox',
        codeUrl: 'elements/Frame/Box/RenderBox/demo.dart',
        contentList: [
          _Text,
          _Text1,
          RotatedDemo(),
        ],
        docUrl:
            'https://docs.flutter.io/flutter/widgets/RotatedBox-class.html');
  }
}
