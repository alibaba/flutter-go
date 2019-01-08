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
> AlertDialog 向用户传递信息的弹出层。



### **基本用法**

> 通常作为子窗口小部件传递给showDialog，后者显示对话框。

当**AlertDialog**的的元素过多过长时, 请优先考虑**SingleChildScrollView** 用来避免内容溢出



""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Dialog/AlertDialog';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'AlertDialog',
      codeUrl: 'components/Dialog/AlertDialog/demo.dart',
      contentList: [
        _Text0,
        AlertDialogDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/AlertDialog-class.html',
    );
  }
}
