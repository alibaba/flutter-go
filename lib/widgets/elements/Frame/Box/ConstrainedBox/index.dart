/// Author: xiaojia.dxj
/// Date: 2019-01-08 15:56:53 
/// Last Modified by:   xiaojia.dxj
/// Last Modified time: 2019-01-08 15:56:53 
/// email: xiaojia.dxj@alibaba-inc.com

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String _Text = '''
### **简介**
> 添加额外的限制条件到child上
- 比如说，你限制child最小高度为50.0像素，就可以用constraints: const BoxConstraints(minHeight：50）

''';
const String _Text1 = '''
### **基本用法**
> 添加额外的限制条件到child上
- ex:添加ConstrainedBox约束如下，传入不同Width约束的Container效果
minWidth: 100.0,
minHeight: 20.0,
maxWidth: 300.0,
maxHeight: 50.0

''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/ConstrainedBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'ConstrainedBox',
      codeUrl: 'elements/Frame/Box/ConstrainedBox/demo.dart',
      contentList: [
        _Text,
        _Text1,
        // maxWidth: 300.0,
        ConstrainedBoxCreate(currWidth: 500, describe: "currWidth>maxWidth"),
        SizedBox(
          height: 10.0,
        ),
        ConstrainedBoxCreate(currWidth: 300, describe: "currWidth=maxWidth"),
        SizedBox(
          height: 10.0,
        ),
        ConstrainedBoxCreate(currWidth: 200, describe: "currWidth<maxWidth"),
        SizedBox(
          height: 10.0,
        ),

        // minWidth: 100.0,
        ConstrainedBoxCreate(currWidth: 150, describe: "currWidth>minWidth"),
        SizedBox(
          height: 10.0,
        ),
        ConstrainedBoxCreate(currWidth: 100, describe: "currWidth=minWidth"),

      ],
      docUrl:
          'https://docs.flutter.io/flutter/widgets/ConstrainedBox-class.html',
    );
  }
}
