import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart' as TextBox;

const String _Text = """### **TextBox简介**
> 是一个包含一段文本的矩形
- 它与rect类似，不过包含一个固定的TextDirection。
- sizebox的width，heigh为null，child自身设置
### **属性**
> width：宽
> height：高
- ex:200*50 sizebox
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/TextBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'TextBox',
      codeUrl: 'elements/Frame/Box/TextBox/demo.dart',
      contentList: [
        _Text,
        _creatTexbox(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/dart-ui/TextBox-class.html',
    );
  }
}

Column _creatTexbox() {
  return Column(
    children: <Widget>[
      // Text("TextBox ",textDirection:  new TextBox.fo,),
      Container(
        // child:  TextBox.fromLTRB(270.0, 180.0, 1360.0, 730.0,TextDirection.rtl),

      )
    
//  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),

    
    ],
  );
}
