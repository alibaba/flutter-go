/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 10:26
 * email: sanfan.hx@alibaba-inc.com
 * target:  xxx
 */
import 'package:flutter_go/components/widget_demo.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> AlertDialog 向用户传递信息的弹出层。警报对话框
- 一般使用在通知用户需要确认的情况，具有可选标题和可选的操纵列表。标题显示在上方，操纵内容显示在内容区域，即下方

### **基本用法**
> 通常作为子窗口小部件传递给showDialog，后者显示对话框。
- 当**AlertDialog**的的元素过多过长时, 请优先考虑**SingleChildScrollView** 用来避免内容溢出
- 需要注意的是，由于AlertDialog 通常使用child的大小来调整自身大小，所以使用一些widget（如ListView，GridView和CustomScrollView）将无法正常工作
- 当需要给用户提供多个选项的供选择时，请使用SimpleDialog
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
