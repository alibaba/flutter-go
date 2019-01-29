/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/1/20
 * Time: 下午10:57
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoButton 的示例
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as demoBox;

const String content0 = '''
### **简介**
> ios 风格的 button
- 与普通的 button 一样，需要设置 text 或者 icon, 不同的是带有 fades out 效果;
- 同时可以设置一个背景颜色;
''';

const String content1 = '''
### **基本用法**
> CupertinoButton 的一个是示例
- 属性基本和 flatButton,raisedButton 类似
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoButton';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoButtonFullDefault()
      ],
      title: 'CupertinoButton',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoButton-class.html',
      codeUrl: '/themes/Cupertino/CupertinoButton/demo.dart',
    );
  }
}