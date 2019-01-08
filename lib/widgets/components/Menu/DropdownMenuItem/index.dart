/*
 * @Author: 一凨 
 * @Date: 2018-12-27 11:20:07 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-27 14:51:44
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import './demo.dart';


const String content0 = '''
### **简介**
> DropdownButton 创建的一个菜单项
- DropdownButton 是 Material 设计风格中的一个从列表中选择某一个item的按钮
- DropdownButton 按钮显示选定的Item的值以及打开用于选择其他item的菜单箭头
- DropdownMenuItem<T> 这里面的T代表入参的类型，注意在给定菜单中，所有的item的类型要保持一致
''';

const String content1 = '''
### **基本用法**
> 配合 DropdownButton 使用
- value 选中返回的值
- child 子Widget项
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Menu/DropdownMenuItem';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content0,
        content1,
        DropdownMenuItemDemo(),
      ],
      title: 'DropdownMenuItem',
      docUrl: 'https://docs.flutter.io/flutter/material/DropdownMenuItem-class.html',
      codeUrl: 'components/Menu/DropdownMenuItem/demo.dart',
    );
  }
}