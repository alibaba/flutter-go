/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-29 15:04:51 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-29 16:22:06
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import '../PopupMenuDivider/demo.dart';

const String content0 = '''
### **简介**
> 这个state 是 PopupMenuItem 子类
- 默认情况下，它实现了Material Design弹出菜单项的基本样式和布局，然而这个buidlChild方法可以重写，以调整放置在菜单中的位置。默认它返回PopupMenuItem.child。

''';

const String content1 = '''
### **基本用法**
- PopupMenuDivider 是一条水平分割线，注意数组要使用父类 PopupMenuEntry，配合其他 item 样式共同使用
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Menu/PopupMenuItem';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        PopupMenuDividerDemo()
      ],
      docUrl: "https://docs.flutter.io/flutter/material/PopupMenuItem-class.html",
      codeUrl: 'components/Menu/PopupMenuEntry/demo.dart',
      title: 'PopupMenuItem',
    );
  }
}