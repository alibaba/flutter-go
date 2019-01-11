/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午2:56
 * email: zhu.yan@alibaba-inc.com
 * tartget: Card 的示例
 */
import '../../../../common/widget-demo.dart';
import '../../../../routers/application.dart';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as CardDemo;

const String _Text0 =
"""### **简介**
> Card “卡片”
- 卡片是用于表示一些相关信息的一张材料，例如相册，地理位置，用餐，联系方式等
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
      codeUrl: '${Application
          .github['widgetsURL']}componentss/Card/Card/demo.dart',
      child: allCheckboxs(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/Card-class.html',
    );
  }
}

/*
 * 所有的 Card widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allCheckboxs(BuildContext context, _DemoState that) {
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _Text0),
            SizedBox(height: 20.0), // 间距
            MarkdownBody(data: _Text1),
            SizedBox(height: 20.0), // 间距
            CardDemo.CardLessDefault()
          ])
  );
}

