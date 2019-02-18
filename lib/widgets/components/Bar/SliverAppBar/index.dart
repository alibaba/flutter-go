/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午4:10
/// email: zhu.yan@alibaba-inc.com
/// target: SliverAppBar 的示例

import 'package:flutter_go/components/widget_demo.dart';

import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as SliverAppBarDemo;

const String _Text0 =
"""### **简介**
> SliverAppBar “应用栏”
- 它类似于Android中的toolbar;
""";


const String _Text1 =
"""### **基本用法**
> 虽然基本相同，构造方法也是非常的简单，但是却不能直接使用它，由官方文档可以看到通常结合 ScrollView 来使用它;
- AppBar 和 SliverAppBar 都是继承StatefulWidget 类，都代表 Toobar;
- 二者的区别在于 AppBar 位置的固定的应用最上面的;而 SliverAppBar 是可以跟随内容滚动的;
- 下面的示例,放在 NestedScrollView 实现上提到顶的悬停;
""";

class Demo extends StatefulWidget {
  static const String routeName = '/components/Bar/SliverAppBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SliverAppBar',
      codeUrl: 'components/Bar/SliverAppBar/demo.dart',
      contentList:[allDomes(context, this)],
      docUrl: 'https://docs.flutter.io/flutter/widgets/SliverAppBar-class.html',
    );
  }
}

/*
 * 所有的 SliverAppBar widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allDomes(BuildContext context, _DemoState that) {
  return Container(
    //padding:  EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _Text0),
            SizedBox(height: 20.0), // 间距
            MarkdownBody(data: _Text1),
            SizedBox(height: 20.0), // 间距
            SliverAppBarDemo.SliverAppBarLessDefault()
          ])
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt) {
  return  Align(
      alignment: FractionalOffset.centerLeft,
      child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            MarkdownBody(data: txt)
          ])
  );
}


