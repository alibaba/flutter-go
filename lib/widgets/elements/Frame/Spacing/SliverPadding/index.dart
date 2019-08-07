 /// @Author: 一凨 
 /// @Date: 2018-11-28 20:26:16 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2019-01-14 17:06:36

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './sliverpadding_demo.dart';

const contentDesc0 = '''
### **简介**
> SliverPadding 属于 Flutter Slivers大家族中的一个
- SliverPadding 是 Slivers 大家族中的一类padding
- 可以配合各种 Sliver成员使用
''';

const contentDesc1 = '''
### **基本用法**
> 这里我们结合Slivers家族中的 SliverList 来演示使用
- Flutter 中的Slivers大家族基本都是配合CustomScrollView来实现一些自定义滚动效果
- padding作用于每一个item
- 对于有些特殊的sliver可能会有副作用，比如对于 ```pinned:true``` 的 SliverPersisitentHeader 设置可能会导致 APPBar与之前的sliver重叠
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/spacing/SliverPadding';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SliverPadding',
      codeUrl: 'elements/Frame/Spacing/SliverPadding/sliverpadding_demo.dart',
      contentList: [
        contentDesc0,
        contentDesc1,
        SliverPaddingDemo(),
      ],
      docUrl:
          'https://docs.flutter.io/flutter/widgets/SliverPadding-class.html',
    );
  }

  
}
