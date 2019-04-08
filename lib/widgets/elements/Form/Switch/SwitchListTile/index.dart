 /// Created with Android Studio.
 /// User: 三帆
 /// Date: 28/12/2018
 /// Time: 15:48
 /// email: sanfan.hx@alibaba-inc.com
 /// target:  xxx
import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import  'demo.dart';

const contentA = '''
### **简介**
> Switch 的一个衍生组件

基本用法与Switch相同.具体参考@Switch, 支持各种自定义样式.



### **基本实例**

''';


class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Switch/SwitchListTile';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SwitchListTile',
      codeUrl: 'elements/Form/Switch/SwitchListTile/demo.dart',
      contentList: [
        contentA,
        SwitchListTileDemo()
      ],
      docUrl: '',
    );
  }
}
