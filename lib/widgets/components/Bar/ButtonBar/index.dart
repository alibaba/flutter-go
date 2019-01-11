/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午11:10
 * email: zhu.yan@alibaba-inc.com
 * tartget: ButtonBar 的示例
 */
import '../../../../common/widget-demo.dart';
import '../../../../routers/application.dart';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as ButtonBarDemo;

const String _Text0 =
"""### **简介**
> ButtonBar “末端对齐的按钮容器”
- 横排的Button布局
""";


const String _Text1 =
"""### **基本用法**
> 根据当前ButtonTheme中的填充水平放置按钮 。子 button 在布置行与 MainAxisAlignment.end
- 当Directionality为TextDirection.ltr时，按钮栏的子项右对齐，最后一个子项成为最右边的子项。当Directionality TextDirection.rtl时，子项被左对齐，最后一个子项成为最左边的子项。
""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Bar/ButtonBar';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'ButtonBar',
      codeUrl: '${Application
          .github['widgetsURL']}componentss//Bar/ButtonBar/demo.dart',
      child: allCheckboxs(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/ButtonBar-class.html',
    );
  }
}

/*
 * 所有的 ButtonBar widget
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
            //SizedBox(height: 20.0), // 间距
            ButtonBarDemo.ButtonBarLessDefault()
          ])
  );
}

