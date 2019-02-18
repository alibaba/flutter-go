/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 10:26
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */
import 'package:flutter_go/components/widget_demo.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> GridViewPaper是GridView中的item的一种展现形式, 会在上层浮现一层网络.

""";



class Demo extends StatefulWidget {
  static const String routeName = '/components/Grid/GridPaper';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'GridPaper',
      codeUrl: 'components/Grid/GridPaper/demo.dart',
      contentList: [
        _Text0,
        GridPaperDemo(),
        SizedBox(
          height: 100.0,
        )
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/GridPaper-class.html',
    );
  }
}
