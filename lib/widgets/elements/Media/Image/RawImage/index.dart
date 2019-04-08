 /// @Author: 一凨 
 /// @Date: 2018-11-16 15:09:12 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2018-12-08 20:11:44

import 'package:flutter/material.dart';

import './raw_image_demo.dart';
import 'package:flutter_go/components/widget_demo.dart';

const contentText0 = '''
### **简介**
> 一个直接显示dart:ui.Image的widget
''';

const contentText1 = '''
### **基本用法**
> RawIamge很少使用，推荐使用Image
- RawImage 是通过 paintImage 绘制出来的Image。这个方法更加详细的描述了各个字段的含义
- 传递给RawImage中的Image是dart：ui下的Image而不是Material下的Image，见Demo注释

''';

const contentText2= '''
### **高级用法**
> 关于更多详细介绍，请看paintImage的属性说明
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/RawImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'elements/Media/Image/RawImage/raw_image_demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/RawImage-class.html',
      title: 'RawImage',
      contentList: [
        contentText0,
        contentText1,
        RawImageDemo(),
        contentText2,
      ],
    );
  }
}
