/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 下午10:57
/// email: zhu.yan@alibaba-inc.com
/// target: CupertinoNavigationBar 的示例

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBox;

const String content0 = '''
### **简介**
> ios 风格的 导航栏
- 构成 toolbar 的最基本 widget,常规页面的 title,在 toolbar 居中显示;
- 当居中显示时,它支持通过设置 leading 和 trailing 属性对应的 widget，来决定是在中间 widget 前面还是后面显示;
- leading widget 将自动的成为一个返回 chevron icon button（或全屏对话框的关闭按钮）,如果没有提供，则弹出当前路由，并且automaticallyImplyLeading为true（默认为true）;
- 如果没有提供，并且 automaticallyImplyIdle 为true,则中间的 widget 将自动成为当前 CupertinoPageRoute 中的 title。
- 它应该被放在屏幕的顶部，并自动占据操作系统的状态栏。
- 如果给定 backgroundColor 的不透明度不是1.0（默认情况下为1.0），它将对其后面的内容产生模糊效果。
- 当路 transitionBetweenRoutes 为 true，如果被切换的路由还拥有一个 CupertinaVigationBar 或一个 CupertinoSiverNavigationBar，并且 transitionBetweenRoutes 设置为 true，则此导航栏将在路由顶部而不是在路由内部进行切换。
- 如果 transitionBetweenRoutes 为 true，则任何 widget 的参数，都不能在其子树中包含 key，因为该 widget 将同时存在于树中的多个位置。
- 默认情况下，每个页面路由中只应存在一个 CupertinaVigationBar 或 CupertinoSiverNavigationBar，以支持默认切换。
- 使用 transitionBetweenRoutes 或 Herotag 可自定义每个路由的多个导航栏的切换行为。
''';

const String content1 = '''
### **基本用法**
> CupertinoNavigationBar 的一个示例
- 通常被 CupertinoPageScaffold 包裹
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoNavigationBar';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoNavigationBarFullDefault(),
        SizedBox(height: 50)
      ],
      title: 'CupertinoNavigationBar',
      docUrl:
          'https://docs.flutter.io/flutter/cupertino/CupertinoNavigationBar-class.html',
      codeUrl: 'themes/Cupertino/CupertinoNavigationBar/demo.dart',
    );
  }
}
