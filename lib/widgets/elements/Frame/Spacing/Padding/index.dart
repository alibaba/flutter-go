/*
 * @Author: 一凨 
 * @Date: 2018-11-28 20:25:24 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-14 17:01:55
 */
import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import './padding_demo.dart';

const contentDesc0='''
### **简介**
> widget 内边距
- 类似于前端中的 div+css:padding 效果
- Container + padding = Padding
''';

const  contentDesc1 = '''
### **基本用法**
> Padding widget 的padding必须设置，不能为null
- 通过给定的padding值来隔开子组件
- 通过EdgeInsets 类来计算 padding的大小
''';
class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/spacing/Padding';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Padding',
      contentList: [
        contentDesc0,
        contentDesc1,
        PaddingDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/Padding-class.html',
      codeUrl:
          'elements/Frame/Spacing/Padding/padding_demo.dart',
    );
  }
}
