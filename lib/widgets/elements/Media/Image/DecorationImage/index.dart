/*
 * @Author: 一凨 
 * @Date: 2018-11-16 15:09:12 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-11-16 15:12:39
 */
import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './decorationImage_demo.dart';


const contentText0 = '''
### **简介**

> 修饰Box的图片
''';

const contentText1= '''
### **基本用法**

> demo演示作为背景图片的样例

- 一般配合BoxDecoration的img属性使用,设置背景图片
- 也可以配合paintImage使用
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/DecorationImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        contentText0,
        contentText1,
        DecorationImageDemo(),
      ],
      codeUrl: 'elements/Media/Image/DecorationImage/index.dart?1542705856254',
      docUrl:
          'https://docs.flutter.io/flutter/painting/DecorationImage-class.html',
      title: 'DecorationImage',
    );
  }
}
