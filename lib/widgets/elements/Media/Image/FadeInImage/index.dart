 /// @Author: 一凨 
 /// @Date: 2018-12-08 14:26:00 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2018-12-08 16:10:55

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './fade_in_image_demo.dart';


const contentText0 = '''
### **简介**
> placeHodler image到目标图片的一种过渡widget
- 使用FadeInImage可以类似网络加载的图片以一个更加优雅的形式出现在屏幕上
- 如果这个图片已经被加载了，或者已经存在内存中，那么placeholder图片将不会显示
''';

const contentText1 = '''
### **基本用法**
> FadeInImage的写法跟Image类似，有很多别的命名构造函数。
- fadeOutDuration和fadeOutCurve控制placeholder的淡出动画
- fadeInDuration和fadeInCurve控制目标图像的淡入动画
- 对于placeholder，更倾向于使用已经缓存的，以防止他也会突然的出现在屏幕上

''';


class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Image/FadeInImage';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'elements/Media/Image/FadeInImage/fade_in_image_demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/FadeInImage-class.html',
      title:'FadeInImage',
      contentList: [
        contentText0,
        contentText1,
        FadeInImageDemo(),
      ],
    );
  }
}
