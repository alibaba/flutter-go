 /// @Author: 一凨 
 /// @Date: 2018-11-16 15:09:12 
 /// @Last Modified by:   一凨 
 /// @Last Modified time: 2018-11-16 15:09:12 

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';

const contentText0 = '''
### **简介**
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/DecorationImagePainter';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
       contentList: [],
       docUrl: 'https://docs.flutter.io/flutter/painting/DecorationImagePainter-class.html',
       codeUrl: 'elements/Media/Image/DecorationImagePainter/decoration_image_painter_demo.dart',
       title:'DecorationImagePainter'
    );
  }
}

