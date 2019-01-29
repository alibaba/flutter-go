/**
 * Created with 菜鸟手册.
 * User: 一晟
 * Date: 2018/11/14
 * Time: 下午4:31
 * email: zhu.yan@alibaba-inc.com
 * target: DropdownButton 的示例
 * 对应文档地址:https://docs.flutter.io/flutter/material/DropdownButton-class.html
 */
import 'package:flutter_go/components/widget_demo.dart';

import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as dropdownButton;


const String _dropdownText0 =
"""### **简介**
> Dropdown button “用于从项目列表中进行选择的按钮”
- 参数类型 T 是下拉菜单表示的值的类型。给定菜单中的所有条目必须表示具有一致类型的值。通常，使用枚举。每个DropdownMenuItem在项目必须专门与同类型的说法；
""";

const String _dropdownText1 =
"""### **基本用法**
> 此示例显示一个包含四个项目的菜单
""";

const String _dropdownText2 =
"""### **进阶用法**
> 此示例尝试调整所有属性，展示出效果
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/DropdownButton';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String buttonShapeType = 'border'; // 边框类型
  void setButtonShapeType(){
    //String _buttonShapeType = (buttonShapeType == 'border') ? 'radius' : 'border';
    this.setState((){
      //buttonShapeType = _buttonShapeType;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'DropdownButton',
      codeUrl: 'elements/Form/Button/DropdownButton/demo.dart',
      contentList: [allDropdownButtons(context,this)],
      docUrl: 'https://docs.flutter.io/flutter/material/DropdownButton-class.html',
    );
  }
}

/*
 * 所有的 DropdownButton 按钮
 */
Widget allDropdownButtons(BuildContext context,_DemoState that){
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _dropdownText0),
            textAlignBar(_dropdownText1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                dropdownButton.DropdownButtonDefault(),
              ],
            ),
            textAlignBar(_dropdownText2),
            SizedBox(height: 10.0),
            dropdownButton.DropdownButtonCustom(context.widget,that),
            SizedBox(height: 20.0)
          ])
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt){
  //style: new TextStyle(fontSize: 15.5, height: 1.2),textAlign:TextAlign.left
  return new Align(
      alignment: FractionalOffset.centerLeft,
      child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            MarkdownBody(data: txt)
            //new Text(txt, style: new TextStyle(fontSize: 15.5,height: 1.2,color:Colors.blue),textAlign:TextAlign.left)
          ])
  );
}

