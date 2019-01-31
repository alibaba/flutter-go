import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String Text0 = """### **简介**
> Row 是一个将其child显示在水平数组的widget
- 将其child填充可用的横向水平空间，一行高度是childs的最大高度（即：总是满足传入的垂直约束）
- 如果你只有一个child，只需要考虑使用对其或者中间位置，如果多个child，注意扩展水平空间(Expanded)，可以将child封装在一个扩展部件里面
- 当我们看到行有黄色和黑色条纹警告时候，说明行已经溢出，当行溢出，行之间空间将没有任何空间可供扩展。

""";

const String Text1 = """
### **基本用法**
> 水平布局，设置位置对齐方式

mainAxisSize 属性
- 一行的高度是有mainAxisSize属性控制，默认是max

 mainAxisAlignment属性
- 将children放置在主轴某位置

 CrossAxisAlignment 属性
- crossAxisAlignment: crossAxisAlignment.center/end/start,
- 即，根据设定的位置交叉对齐
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Layout/Row';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Row',
      // desc: 'Layout-Row 使用',
      codeUrl: 'elements/Frame/Layout/Row/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/Row-class.html',
      contentList: [
        Text0,
        Text1,
        _rowCreate(),
      ],
    );
  }

  Column _rowCreate() {
    return  Column(
      children: <Widget>[
        RowLayoutCreate(),
        Row(
          children: <Widget>[
            Expanded(
              child:
                  Text('Deliver features faster', textAlign: TextAlign.center),
            ),
            Expanded(
              child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: const FlutterLogo(),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            const FlutterLogo(),
            const Expanded(
              child: const Text(
                  'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
            ),
            const Icon(Icons.sentiment_very_satisfied),
          ],
        ),
        SizedBox(height: 30.0),
        RowMainAxisAlignment(MainAxisAlignment.spaceEvenly, null),
        SizedBox(height: 10.0),
        RowMainAxisAlignment(MainAxisAlignment.spaceAround, null),
        SizedBox(height: 10.0),
        RowMainAxisAlignment(MainAxisAlignment.spaceBetween, null),
        SizedBox(height: 30.0),
        RowMainAxisAlignment(MainAxisAlignment.start, null),
        SizedBox(height: 10.0),
        RowMainAxisAlignment(MainAxisAlignment.center, null),
        SizedBox(height: 10.0),
        RowMainAxisAlignment(MainAxisAlignment.end, null),
      ],
    );
  }
}
