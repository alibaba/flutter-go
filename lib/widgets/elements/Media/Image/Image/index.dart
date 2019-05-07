 /// @Author: 一凨 
 /// @Date: 2019-01-07 15:33:42 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2019-01-07 15:42:54

import 'package:flutter/material.dart';

import './demo.dart';
import 'package:flutter_go/components/widget_demo.dart';

const String content0 = '''
### **简介**
> 用于展示图片的widget
- 对于原始解码图像数据的不透明处理
- 如果需要获取Image对象，可以考虑使用 instantiateImageCodec
- 如果需要绘制图片，可以考虑使用  Canvas,比如： Canvas.drawImage
''';

const String content1 = '''
### **基本用法**
> 这里主要介绍加入图片的几种方式
- Image.asset:加载资源图片，就是加载项目资源目录中的图片,加入图片后会增大打包的包体体积，用的是相对路径
- Image.network:网络资源图片，意思就是你需要加入一段http://xxxx.xxx的这样的网络路径地址
- Image.file:加载本地图片，就是加载本地文件中的图片，这个是一个绝对路径，跟包体无关
- Image.memory: 加载Uint8List资源图片
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/Image';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
       title: 'Image',
       codeUrl: 'elements/Media/Image/Image/demo.dart',
       docUrl: 'https://docs.flutter.io/flutter/dart-ui/Image-class.html',
       contentList: [
         content0,
         content1,
         ImageDemo(),
       ],
    );
  }
}