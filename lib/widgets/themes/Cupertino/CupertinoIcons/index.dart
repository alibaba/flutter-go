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
> Cupertino图标的标识符
- 与Icon类一起使用以显示特定图标;
- 请确保cupertino_icons在项目的pubspec.yaml文件中添加依赖项。这可确保CupertinoIcons字体包含在您的应用程序中;
''';

const String content1 = '''
### **基本用法**
> CupertinoIcons 的一个示例
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoIcons';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoIconsFullDefault()
      ],
      title: 'CupertinoIcons',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoIcons-class.html',
      codeUrl: 'themes/Cupertino/CupertinoIcons/demo.dart'
    );
  }
}