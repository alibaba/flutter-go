/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 10:26
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */
import '../../../../common/widget_demo.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> Scaffold的State对象

通常用来控制**SnackBars**和**BottomSheets**和**Drawer**的显示与隐藏. 



### **基本用法**
- 通过为Scaffold定义key属性, 声明_scaffoldState, 通过_scaffoldState直接调用scaffoldState方法
- 当组件无法直接为Scaffold定义key属性时, 可以通过 **Context**与**Scaffold.of**获取父级scaffoldState

""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Scaffold/ScaffoldState';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'ScaffoldState',
      codeUrl: 'components/Scaffold/ScaffoldState/demo.dart',
      contentList: [
        _Text0,
        ScaffoldStateDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/ScaffoldState-class.html',
    );
  }
}
