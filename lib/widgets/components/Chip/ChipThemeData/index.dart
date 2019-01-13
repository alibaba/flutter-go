/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-18 15:14:03 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-18 17:38:56
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 保存chip主题的颜色，形状和文本样式
- 使用它配置chipTheme widget，或者为Theme widget小部件设置 ThemeData.chipTheme。
 
''';
const String content1 = '''
### **基本用法**
- 创建ChipThemeData最简单的方法是使用copyWith您从得到一个ChipTheme.of，
或创建一个全新的一个具有 ChipThemeData..fromDefaults
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Chip/ChipThemeData';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [
          content0,
          content1,
         ChipThemeDemo(),
        ],
        codeUrl: 'components/Chip/ChipThemeData/demo.dart',
        docUrl:
            'https://docs.flutter.io/flutter/material/ChipThemeData-class.html',
        title: 'ChipThemeData');
  }
}
