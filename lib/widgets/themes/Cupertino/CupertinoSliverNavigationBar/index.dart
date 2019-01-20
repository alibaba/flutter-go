import 'package:flutter/material.dart';
import 'package:flutter_go/common/widget_demo.dart';
import 'package:flutter_go/widgets/themes/Material/MaterialColor/demo.dart';
import 'demo.dart';
const Text0 = '''
### **简介**
> ios-11风格下拥有一个较大标题块的导航栏目

### **基本用法**

> 该组件使用时. 必须做为含有slivers属性的滚动列表的子组件中,例如CustomScrollView
''';


class Demo extends StatefulWidget {
  static const String routeName =
      '/element/themes/Cupertino/CupertinoSliverNavigationBar';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoSlider',
      codeUrl: '/themes/Cupertino/CupertinoSliverNavigationBar/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSliverNavigationBar-class.html',
      contentList: [
        Text0,
        CupertinoSliverNavigationBarDemo(),
        SizedBox(height: 100),
      ],
    );
  }
}
