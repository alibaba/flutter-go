/*
 * @Author: xiaojia.dxj
 * @Date: 2019-01-08 15:56:53 
 * @Last Modified by:   xiaojia.dxj
 * @Last Modified time: 2019-01-08 15:56:53 
 */
import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import 'demo.dart';

const String _Text = '''
### **简介**
> 添加额外的限制条件到child上
- 比如说，你限制child最小高度为50.0像素，就可以用constraints: const BoxConstraints(minHeight：50）

''';
const String _Text1 = '''
### **基本用法**
> 添加额外的限制条件到child上
- 比如说，你限制child最小高度为50.0像素，就可以用constraints: const BoxConstraints(minHeight：50）

''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/ConstrainedBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'ConstrainedBox',
      codeUrl: 'elements/Frame/Box/ConstrainedBox/demo.dart',
      contentList: [
        _Text,
        _Text1,
        ConstracubedBox(),
      ],
      docUrl:
          'https://docs.flutter.io/flutter/widgets/ConstrainedBox-class.html',
    );
  }
}
