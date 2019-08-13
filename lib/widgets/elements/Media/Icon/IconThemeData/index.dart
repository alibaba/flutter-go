import 'package:flutter_web/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const Text = '''
### **简介**
> IconThemeData为图标提供属性，必须是Icon的父级
- 图标主题Icon和ImageIcon的依赖,获取当前主题，是用IconTheme.of
''';
const Text1 = '''
### **基本用法**
- 部分widget无法管理大小，IconThemeData的size属性失效。
- 通过opacity属性，修改widget透明度，如下图
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Icon/IconThemeData';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'IconThemeData',
      codeUrl: 'elements/Media/Icon/IconThemeData/demo.dart',
      contentList: [
        Text,
        Text1,
        IconThemeDataLayout(),
      ],
      docUrl:
          'https://docs.flutter.io/flutter/widgets/IconThemeData-class.html',
    );
  }
}

class IconThemeDataLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconThemeDemo(
              curColor: Colors.red,
              curOpacity: 1.0,
            ),
            IconThemeDemo(
              curColor: Colors.red,
              curOpacity: 0.5,
            ),
            IconThemeDemo(
              curColor: Colors.red,
              curOpacity: 0.2,
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        IconThemeDemo2(curColor: Colors.white),
      ],
    );
  }
}
