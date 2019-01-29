/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午10:38
 * email: zhu.yan@alibaba-inc.com
 * tartget: FlexibleSpaceBar 的示例
 */
import '../../../../common/widget_demo.dart';

import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as FlexibleSpaceBarDemo;

const String _Text0 =
"""### **简介**
> FlexibleSpaceBar “扩展和折叠的应用栏”
- AppBar 的一部分，可以扩展和折叠;
""";


const String _Text1 =
"""### **基本用法**
> 最常用于 SliverAppBar.flexibleSpace 字段
- 灵活的空格键随着应用滚动而扩展和收缩，以便 AppBar 从应用程序的顶部到达应用程序滚动内容的顶部;
- 要调整 AppBar 大小,必须将其包装在 FlexibleSpaceBar.createSettings 返回的 widget 中 ，以将大小调整信息传递给 FlexibleSpaceBar;
""";


class Demo extends StatefulWidget {
  static const String routeName = '/components//Bar/FlexibleSpaceBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'FlexibleSpaceBar',
      codeUrl: 'components/Bar/FlexibleSpaceBar/demo.dart',
      contentList: [allDomes(context, this)],
      docUrl: 'https://docs.flutter.io/flutter/material/FlexibleSpaceBar-class.html',
    );
  }
}

/*
 * 所有的 FlexibleSpaceBar widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allDomes(BuildContext context, _DemoState that) {
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _Text0),
            SizedBox(height: 20.0), // 间距
            MarkdownBody(data: _Text1),
            SizedBox(height: 20.0), // 间距
            FlexibleSpaceBarDemo.FlexibleSpaceBarLessDefault(),
            SizedBox(height: 20.0), // 间距
          ])
  );
}

