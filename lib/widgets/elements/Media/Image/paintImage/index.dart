/*
 * @Author: 一凨 
 * @Date: 2018-11-16 15:09:12 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-08 20:19:01
 */
import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './paint_image_demo.dart';

const String contentText0 = '''
### **非Widget 待删除**

''';

const String contentText1 = '''

''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/paintImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        contentText0,
      ],
      codeUrl: 'elements/Media/Image/paintImage/paint_image_demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/painting/paintImage.html',
      title: 'paintImage',
    );
  }
}
