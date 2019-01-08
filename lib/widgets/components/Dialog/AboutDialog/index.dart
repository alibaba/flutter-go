/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 10:26
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */
import '../../../../common/widget_demo.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> AboutDialog 通常用于传递企业或者app的官方信息



### **基本用法**

>  通常作为子窗口小部件传递给showDialog，后者显示对话框。

""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Dialog/AboutDialog';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'AlertDialog',
      codeUrl: 'components/Dialog/AboutDialog/demo.dart',
      contentList: [
        _Text0,
        AboutDialogDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/AboutDialog-class.html',
    );
  }
}
