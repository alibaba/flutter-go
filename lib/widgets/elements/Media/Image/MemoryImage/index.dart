/*
 * @Author: 一凨 
 * @Date: 2018-11-16 15:09:12 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-08 20:48:28
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './memory_image_demo.dart';

const String _contentText0 = '''
### **简介**
> 将给定的Uint8List 缓冲区解码为图像的widget
- 甚至我们也可以利用的来实现将Base64编码的图片展示出来（利用 Uint8List.fromtList 构造函数） 
''';

const String _contentText1 = '''
### **基本用法**
> demo中我们作为读取内存图片来展示
- 提供给MemoryImage的字节不应该再有更改
- 如果需要经常改变的图片，请使用ImageProvider下的子类
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/MemoryImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        _contentText0,
        _contentText1,
        MemoryImageDemo(),
      ],
      title: 'MemoryImage',
      // desc: 'MemoryImage 使用介绍',
      docUrl: 'https://docs.flutter.io/flutter/painting/MemoryImage-class.html',
      codeUrl:
          'elements/Media/Image/MemoryImage/index.dart?1542777213280',
    );
  }
}
