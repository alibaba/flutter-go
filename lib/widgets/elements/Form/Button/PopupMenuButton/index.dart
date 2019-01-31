/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/11/24
 * Time: 下午5:25
 * email: zhu.yan@alibaba-inc.com
 * tartget: PopupMenusButton 的示例
 * 对应文档地址:https://docs.flutter.io/flutter/material/PopupMenuButton-class.html
 */

import 'package:flutter_go/components/widget_demo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as popupMenuButton;

const String _titleText0 = """
### **简介**
> 按下时显示菜单
- 当菜单因为选择了项目而被解除时调用onSelected。传递给onSelected的值是所选菜单项的值;
- 可以提供 `child` 或 `icon` 中的一个，但不是能同时设置两者。如果提供了 `icon` ，则 `PopupMenuButton` 的行为类似于 `IconButton`;
- 如果两者都为null，则创建一个标准 overflow icon（取决于平台）;
""";
const String _titleText1 = """
### **基本用法**
> 此示例显示一个包含四个项目的菜单
- 在枚举值之间进行选择，并_selection根据选择设置字段;
""";

const String _titleText2 = """
### **进阶用法**
> 此示例尝试调整所有属性，展示出效果
- 默认选择第二个;
- 再次打开,`PopupMenuItem` 保留上次的选择结果;
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/PopupMenuButton';
  final Map<String,String> options = {'defaultSelect': '选项二的内容'};
  final _DemoState self =  _DemoState();

  @override
  _DemoState createState() => self;
}

class _DemoState extends State<Demo> {
  String buttonShapeType = 'border'; // 边框类型
  void setButtonShapeType(){
    String _buttonShapeType = (buttonShapeType == 'border') ? 'radius' : 'border';
    this.setState((){
      buttonShapeType = _buttonShapeType;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'PopupMenuButton',
      codeUrl: 'elements/Form/Button/RaisedButton/demo.dart',
      contentList: [allPopupMenuButton(widget,this)],
      docUrl: 'https://docs.flutter.io/flutter/material/PopupMenuButton-class.html',
    );
  }
}

Widget allPopupMenuButton(Demo widget,State parent){
  return Container(
      //padding:  EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
      //mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        MarkdownBody(data: _titleText0),
        SizedBox(height: 20.0),
        MarkdownBody(data: _titleText1),
        Row(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
            popupMenuButton.PopupMenuButtonDefault('default1'),
            popupMenuButton.PopupMenuButtonDefault('default2'),
            popupMenuButton.PopupMenuButtonDefault('default3'),
          ],
        ),
        SizedBox(height: 20.0),
        MarkdownBody(data: _titleText2),
        SizedBox(height: 20.0),
        popupMenuButton.PopupMenuButtonCustom(widget,parent),
        SizedBox(height: 40.0)
      ]
  ));
}