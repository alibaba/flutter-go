/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2018/12/27
 * Time: 下午6:28
 * email: zhu.yan@alibaba-inc.com
 * tartget: BottomNavigationBar 的示例
 */

import 'package:flutter/material.dart';
import  '../../../../common/widget_demo.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as BottomNavigationBarDemo;

const String _text0 =
"""### **简介**
> BottomNavigationBar “底部导航栏”
- 显示在应用程序底部的导航栏,由文本标签，图标或两者形式的多个项目组成;
- 它提供了应用程序顶级视图之间的快速导航;
""";


const String _text1 =
"""### **基本用法**
> BottomNavigationBar 底部导航栏通常与Scaffold结合使用
- 它作为 Scaffold.bottomNavigationBar 参数;
- BottomNavigationBar 3-5个之间个底部按钮数量是合理的，理论上 icon 大小合适，可以支持更多;
- 默认0-3个底部按钮数量时，BottomNavigationBar采用fixed的模式摆放底部按钮，当有4个时默认使用 BottomNavigationBarType.shifting 模式摆放底部按钮;
- 下面的底部导航即是效果;
""";

class Demo extends StatefulWidget {
  static const String routeName = '/components/Navigation/BottomNavigationBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'BottomNavigationBar',
      codeUrl: 'components/Navigation/BottomNavigationBar/demo.dart',
      contentList: [allDemoBoxs(context, this)],
      docUrl: 'https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html',
      bottomNaviBar:BottomNavigationBarDemo.BottomNavigationBarFullDefault()
    );
  }
}

/*
 * 所有的 BottomNavigationBar widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allDemoBoxs(BuildContext context, _DemoState that) {
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _text0),
            textAlignBar(_text1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                //BottomNavigationBarDemo.BottomNavigationBarFullDefault();
              ],
            ),
            SizedBox(width: 20.0), // 间距
          ])
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt) {
  return new Align(
      alignment: FractionalOffset.centerLeft,
      child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            MarkdownBody(data: txt)
          ])
  );
}


