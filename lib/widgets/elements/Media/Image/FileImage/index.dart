/*
 * @Author: 一凨 
 * @Date: 2018-12-08 16:20:33 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-08 19:24:33
 */

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './file_image_demo.dart';

const contentText0 = '''
### **简介**
> 用于展示本地的文件
- 将给定的File对象解码为图片
- 可以指定缩放scale
''';

const contentText1 = '''
### **基本用法**
> 简写形式和Image也都非常相似
- Image.file 是ImageFile 的一种简写形式
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/FileImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'elements/Media/Image/FileImage/file_image_demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/painting/FileImage-class.html',
      title:'FileImage',
      contentList: [
        contentText0,
        contentText1,
        FileImageDemo(),
      ],
    );
  }
}
