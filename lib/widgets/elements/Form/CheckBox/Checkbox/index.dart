/**
 * Created with 菜鸟手册.
 * User: 一晟
 * Date: 2018/11/14
 * Time: 下午4:31
 * email: zhu.yan@alibaba-inc.com
 * target: Checkbox 的示例
 * 对应文档地址:https://docs.flutter.io/flutter/material/Checkbox-class.html
 */
import '../../../../../common/widget_demo.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as checkbox;

const String _checkboxText0 =
"""### **简介**
> checkbox “复选框”
- 复选框本身不保持任何状态
- 当复选框的状态发生变化时，窗口小部件会调用onChanged回调。
- 大多数使用复选框的小部件将侦听onChanged回调，并使用新值重建复选框以更新复选框的可视外观。""";


const String _checkboxText1 =
"""### **基本用法**
> 下面示例展示多个颜色(随机)样式的 `checkbox`
- 一个多选的 `checkbox`
""";

const String _checkboxText2 =
"""### **进阶用法**
> 下面示例展示多个颜色(随机)样式的 `checkbox`
- 一个单选 `checkbox` 操作
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/CheckBox/Checkbox';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int selectValue = -1;
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Checkbox',
      codeUrl: 'elements/Form/Checkbox/Checkbox/demo.dart',
      contentList: [allCheckboxs(context,this)],
      docUrl: 'https://docs.flutter.io/flutter/material/Checkbox-class.html',
    );
  }
}

/**
 * 所有的 Checkbox 按钮
 */
Widget allCheckboxs(BuildContext context,_DemoState that){
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _checkboxText0),
            textAlignBar(_checkboxText1),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children:[
                checkbox.CheckboxDefault(that,0),
                checkbox.CheckboxDefault(that,1),
                checkbox.CheckboxDefault(that,2),
                checkbox.CheckboxDefault(that,3),
                checkbox.CheckboxDefault(that,4),
              ],
            ),
            textAlignBar(_checkboxText2),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                checkbox.CheckboxSelect(context.widget,that,0),
                checkbox.CheckboxSelect(context.widget,that,1),
                checkbox.CheckboxSelect(context.widget,that,2),
                checkbox.CheckboxSelect(context.widget,that,3),
                checkbox.CheckboxSelect(context.widget,that,4),
              ],
            ),
            SizedBox(width: 20.0), // 间距
          ])
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt){
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


