 /// Created with Android Studio.
 /// User: 三帆
 /// Date: 20/12/2018
 /// Time: 17:43
 /// email: sanfan.hx@alibaba-inc.com
 /// target:  xxx

import 'package:flutter_web/material.dart';
import 'package:flutter_web/cupertino.dart';

import 'package:flutter_go/components/widget_demo.dart';
import  'demo.dart';

const contentA = '''
### **简介**
> SliderTheme的data修饰属性 **SliderThemeData**



### **基本用法**

> 配合SliderTheme, 修改slider组件各个部件的样式, 参照@Slider的各组件命名, 修改各部件样式



''';


class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Slider/SliderThemeData';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {
  Color c = CupertinoColors.activeBlue;
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SliderThemeData',
      codeUrl: 'elements/Form/Slider/SliderThemeData/demo.dart',
      contentList: [
        contentA,
         SliderThemeDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/SliderThemeData-class.html',
    );
  }
}
