/// @Author: 一凨
/// @Date: 2018-12-17 13:16:46
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-17 13:34:46

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 使用单个子布局模型的ScrollView
- ListView：一个使用的线性布局的BoxScrollView
- GridView：一个使用二维布局模型的BoxScrollView
- CustomScrollView：可以将多个子布局模型组合到一个滚动视图中
''';
const String content1 = '''
### **基本用法**
> 由于是抽象类，所以不能直接实例化
- 如上简介，我们可以写一个类继承BoxScrollView
- Demo中，演示ListView的部分源码，用以实现继承BoxScrollView的代码编写，效果和ListView并无两样
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/BoxScrollView';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [content0, content1, BoxScrollViewDemo()],
        codeUrl: 'components/Scroll/BoxScrollView/demo.dart',
        docUrl:
            'https://docs.flutter.io/flutter/widgets/BoxScrollView-class.html',
        title: 'BoxScrollView');
  }
}
