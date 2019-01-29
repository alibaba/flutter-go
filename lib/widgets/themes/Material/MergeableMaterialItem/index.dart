/*
 * @Author: xiaojia.dxj
 * @Date: 2019-01-07 16:36:43 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2019-01-08 14:12:32
 */

import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart';

const String content0 = '''
### **简介**
> MaterialSlice 和 MaterialGap的基本类型
- 所有的MergeableMaterialItem对象都需要LocalKey
''';

const String content1 = '''
### **基础用法**
> MaterialSlice进行演示
- MaterialSlice做为 MergeableMaterial子类。它作为Material,可以和其他的slices合并使用
''';

class Demo extends StatefulWidget {
  static const String routeName = '/themes/Material/MergeableMaterialItem';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        MergeableMaterialItemDemo(),
      ],
      title: "MergeableMaterialItem",
      codeUrl: 'Material/MergeableMaterialItem/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/material/MergeableMaterialItem-class.html',
    );
  }
}
