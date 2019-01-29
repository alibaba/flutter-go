import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './demo.dart';

const Text = '''
### **简介**
> 来自ImageProvider的图标，例如AssetImage。
- 图标由其名称标示
''';
const Text1 = '''
### **基本用法**
- 创建图像图标,在size和color默认为当前给定的值IconTheme
- 当你用一个图片时，这个图片会被填充你设置的颜色，只保留图片的形状，
- 即填充图片像素所在的所有位置
''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Media/Icon/ImageIcon';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'ImageIcon',
      codeUrl: 'elements/Media/Icon/ImageIcon/demo.dart',
      contentList: [
        Text,
        Text1,
        ImageIconDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/ImageIcon-class.html',
    );
  }
}
