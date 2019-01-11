/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-17 15:37:16 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-17 16:00:07
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';

const String content0 = '''
### **简介**
> 一个线性进度条
- 有两种线性进度条：确定和不确定。
- 确定：确定进度条在每个时间点都有一个特定的值，并且该值应该是0.0递增到1.0。
- 不确定：不确定的进度条在每一个时间点都没有特定到值。只是表明此时取得的进度，没有表明多少未完成。

''';
const String content1 = '''
### **基本用法**
- 创建确定进度条，需要使用介于0.0和1.0的非空值
- 要创建不确定的进度条，需要使用空值
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Progress/RefreshProgressIndicator';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
          // LinearProgressIndicatorDemo(),
        ],
        codeUrl: '/components/Progress/RefreshProgressIndicator/demo.dart',
        docUrl:'https://docs.flutter.io/flutter/material/RefreshProgressIndicator-class.html',
        title: 'RefreshProgressIndicator');
  }
}
