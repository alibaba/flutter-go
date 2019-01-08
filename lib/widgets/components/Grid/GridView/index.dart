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
> GridView 通常用来做GridTile的header与footer组件;


### **基本用法**

> 1231
""";



class Demo extends StatefulWidget {
  static const String routeName = '/components/Grid/GridView';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'GridTileBar',
      codeUrl: 'components/Grid/GridView/demo.dart',
      contentList: [
        _Text0,
        GridTileDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/GridView-class.html',
    );
  }
}
