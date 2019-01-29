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
> Dialog 向用户传递信息的弹出层。
-这个组件没有任何可操作的选项. 相比使用这个组件, 通常我们更喜欢使用 **AlertDialog**或者**SimpleDialog**



### **基本用法**
> 通常作为子窗口小部件传递给showDialog，后者显示对话框。

""";

const String _Text1 = """
### **进阶用法**

> 犹豫当前组件没有任何可选项目, 我们可以通过自定义样式, 去完成自己想要的各种样式的弹框, 满足我们的个性化需求

注意事项: 当前弹出的dialog并非是一个单纯的组件, 而是一个新路由界面, 如果我想通过操作dialog中的内容, 直接使用setState触发的是原界面中的状态 
""";


class Demo extends StatefulWidget {
  static const String routeName = '/components/Dialog/Dialog';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Dialog',
      codeUrl: 'components/Dialog/Dialog/demo.dart',
      contentList: [
        _Text0,
        DialogDemo(),
        _Text1,
        DialogMoreDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/Dialog-class.html',
    );
  }
}
