/*
 * @Author: 一凨 
 * @Date: 2018-12-20 13:21:36 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-20 14:08:29
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> 使用Slivers创建自定义滚动效果的ScrollView
- CustomScrollView 主要是配合Slivers大家族使用，创建自定义的滚动效果
- 如果需要创建可展开的AppBar，后跟list和grid，可使用这三种Slivers：SliverAppBar、SliverList和SliverGrid
- 这些Slivers必须生成RenderSliver对象
''';

const String content1 = '''
### **基本用法**
> 配合 Slivers使用
- slivers 属性中我们添加SliverAppBar
- SliverAppBar下方放置SliverFixedExtentList，注意此处并没有滚动冲突
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Scroll/CustomScrollView';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        CustomScrollViewDemo(),
      ],
      codeUrl: 'components/Scroll/CustomScrollView/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/CustomScrollView-class.html',
      title: 'CustomScrollView',
    );
  }
}