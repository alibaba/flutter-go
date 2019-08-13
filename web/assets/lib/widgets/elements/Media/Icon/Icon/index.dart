import 'package:flutter_web/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const Text = '''
### **简介**
> 使用IconData中描述的字体（ 例如素材中预定义的IconDatas） 中的字形绘制的图形图标。 
- 该图标不是交互示， 只是展示图标样式。 如果对于有交互要求， 可以使用IconButton
''';
const Text1 = '''
### **基本用法**
- 多用于图标的使用选择 
- 可对图标设置大小， 颜色， 标签等
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Icon/Icon';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Icon',
      codeUrl: 'elements/Media/Icon/Icon/demo.dart',
      contentList: [
        Text,
        Text1,
        IconLayout(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/Icons-class.html',
    );
  }
}

class IconLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconDemo(
          curColor: Colors.redAccent,
        ),
        IconDemo(
          curColor: Colors.yellow,
        )
      ],
    );
  }
}
