/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午2:56
/// email: zhu.yan@alibaba-inc.com
/// target: Card 的示例

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as CardDemo;

const String _Text0 =
"""### **简介**
> Card “卡片”
- 卡片用于表示一些相关信息，例如相册，地理位置，用餐，联系方式等
""";


const String _Text1 =
"""### **基本用法**
> 此示例显示了创建卡片窗口组件，其中显示了相册信息和两个操作
""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Card/Card';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Card',
      codeUrl: 'components/Card/Card/demo.dart',
      contentList: allDomes(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/Card-class.html',
    );
  }
}


/// 所有的 Card widget
/// context: 运行上下文
/// that: 指向有状态的 StatefulWidget
List allDomes(BuildContext context, _DemoState that) {
  return [
    _Text0,
    SizedBox(height: 20.0), // 间距
    _Text1,
    SizedBox(height: 20.0), // 间距
    CardDemo.CardLessDefault()
  ];
}

