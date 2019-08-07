 /// @Author: 一凨 
 /// @Date: 2018-11-16 15:09:12 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2018-12-08 17:32:57

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './network_image_demo.dart';

const contentText0 = '''
### **简介**
> 展示网络图片的widget
- 我们可以使用NetworkImage来获取网络图片并展示
''';

const contentText1 = '''
### **基本用法**
> Image.network 是 NetworkImage 提供给Image widget 的一种简写形式
- 支持scale属性进行图片的缩放
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/NetworkImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        contentText0,
        contentText1,
        NetworkImageDemo(),
      ],
      codeUrl: 'elements/Media/Image/NetworkImage/network_image_demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/painting/NetworkImage-class.html',
      title: 'NetworkImage',
    );
  }
}
