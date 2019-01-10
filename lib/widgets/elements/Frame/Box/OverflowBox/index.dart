/*
 * @Author: xiaojia.dxj
 * @Date: 2019-01-08 15:56:31 
 * @Last Modified by:   xiaojia.dxj
 * @Last Modified time: 2019-01-08 15:56:31 
 */
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart' as overflowBox;

const String Text0 = """### **OverflowBox简介**
> 它对子进程施加的约束不同于从其父进程获得的约束，可能允许子进程溢出父进程.
- 当OverflowBox的最大尺寸大于child的时候，child可以完整显示，当其小于child的时候，则以最大尺寸为基准，当然，这个尺寸都是可以突破父节点的
""";

const String Text1 = """
### **基本用法**
> OverflowBox设置最大/最小尺寸
- SizedOverflowBox，一个特定大小的小部件，但将其原始约束传递给它的子节点，然后可能会溢出。
- ConstrainedBox，一个对其子项施加额外约束的小部件。
- UnconstrainedBox，一个试图让它的child在没有约束的情况下绘制的容器。
- SizedBox，一个具有指定大小的盒子。
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/OverflowBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'OverflowBox',
      codeUrl: 'elements/Frame/Box/OverflowBox/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/OverflowBox-class.html',
      contentList: [
        Text0,
        Text1,
        _OverflowBoxCreate(),
      ],
    );
  }

  Row _OverflowBoxCreate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.yellow,
          child: overflowBox.OverflowBoxDefault(
            curmaxHeight: 50.0,
            curmaxWidth: 50.0,
            curHeight: 100.0,
            curWidth: 100.0,
            curalignment: Alignment.center,
          ),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.yellow,
          child: overflowBox.OverflowBoxDefault(
            curmaxHeight: 150.0,
            curmaxWidth: 150.0,
            curHeight: 50.0,
            curWidth: 50.0,
            curalignment: Alignment.bottomLeft,
          ),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.yellow,
          child: overflowBox.OverflowBoxDefault(
            curmaxHeight: 150.0,
            curmaxWidth: 150.0,
            curHeight: 40.0,
            curWidth: 40.0,
            curalignment: Alignment.topRight,
          ),
        ),
      ],
    );
  }
}
