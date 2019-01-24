/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/1/20
 * Time: 下午10:57
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoPicker 的示例
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart' as demoBox;

const String content0 = '''
### **简介**
> iOS风格的选择器
- 以 wheel 的方式显示子 widget，选择发生改变后的回调; 
- 通常和 showModalBottomSheet 搭配在屏幕底部显示 picker 选择器;
''';

const String content1 = '''
### **基本用法**
> CupertinoPicker 的一个示例
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Cupertino/CupertinoPicker';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        demoBox.CupertinoPickerDemo(),
        SizedBox(height:50)
      ],
      title: 'CupertinoPicker',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoPicker-class.html',
      codeUrl: '/themes/Cupertino/CupertinoPicker/demo.dart',
    );
  }
}