/// @Author: 一凨
/// @Date: 2018-12-20 14:18:36
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-20 14:19:15

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 一个可以嵌在另一个滚动视图中的Scroll view，本质上，他们的滚动是连接着的
- 最常见的用例就是一个可滚动的视图，包含一个 flexible SliverAppBar，并且包含TabBar和TabBarView
- 在普通的ScrollView中包含一系列 slivers ，会出现滚动冲突的问题
- NestedScrollView 通过为外部ScrollView和内部的ScrollViews提供自定义的ScrollController来解决滚动冲突的问题，将他们“连接”起来，以便他们滚动时看起来更像是一个整体
''';
const String content1 = '''
### **基本用法**
> Demo演示NestedScrollView最常见的使用实例
- 头部为一个SliverAppBar，折叠部分的内容都放在了flexibleSpace中
- 由 headerSliverBuilder 构建出来一个包含TabBar的SliverAppBar，并且在body中包含 TabBarView
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/NestedScrollView';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      codeUrl: 'components/Scroll/NestedScrollView/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/widgets/NestedScrollView-class.html',
      contentList: [
        content0,
        content1,
        NestedScrollViewDemo(),
      ],
      title: 'NestedScrollView',
    );
  }
}
