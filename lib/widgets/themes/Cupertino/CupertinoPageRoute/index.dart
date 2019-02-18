/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/1/20
 * Time: 下午10:57
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoPageRoute 的示例
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBox;

const String content0 = '''
### **简介**
> ios 风格全屏切换路由的滑动动画
- 页面从右侧滑入，然后反向退出。当另一页进入覆盖它时，视差中的页面也会向左移动;
- 页面从底部滑入，然后反向退出，全屏 dialogs 没有视差效果;
- 默认情况下，当切换路由被其他路由替换时，前一个路由将保留在内存中。若要在不需要时释放所有资源，请将 maintainstate 设置为 false;
''';

const String content1 = '''
### **基本用法**
> CupertinoPageRoute 的一个示例
- 通常被 CupertinoPageScaffold 包裹
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoPageRoute';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoPageRouteFullDefault(),
        SizedBox(height:50)
      ],
      title: 'CupertinoPageRoute',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoPageRoute-class.html',
      codeUrl: 'themes/Cupertino/CupertinoPageRoute/demo.dart',
    );
  }
}