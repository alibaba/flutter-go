/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2018/12/23
 * Time: 下午6:07
 * email: zhu.yan@alibaba-inc.com
 * tartget: CheckboxListTile 的示例
 */
import '../../../../../common/widget-demo.dart';
import '../../../../../routers/application.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as CheckboxListTileDemo;

const String _CheckboxListTileText0 =
"""### **简介**
> CheckboxListTile “下拉复选框”
- 带有复选框的ListTile,带有标签的复选框。
- 整个列表图块是交互式的：点击图块中的任意位置可切换复选框。
""";


const String _CheckboxListTileText1 =
"""### **基本用法**
> CheckboxListTile 的属性特征
- Checkbox类似的命名属性，比如：onChanged和activeColor。
- 和ListTile类似的命名属性，比如：title, subtitle, isThreeLine，dense。
- selected属性和ListTile.selected 属性类似，但使用的颜色是activeColor属性，默认为当前Theme的颜色。
- onChanged 回调函数为 null,显示禁用
""";

const String _CheckboxListTileText2 =
"""### **进阶用法**
> CheckboxListTile 单选和全选的示例 
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Checkbox/CheckboxListTile';
  bool valBool = true;
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CheckboxListTile',
      codeUrl: '${Application.github['widgetsURL']}elements/Form/Checkbox/CheckboxListTile/demo.dart',
      child: allCheckboxs(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/CheckboxListTile-class.html',
    );
  }
}

/**
 * 所有的 CheckboxListTile widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allCheckboxs(BuildContext context, _DemoState that) {
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children:[
            MarkdownBody(data: _CheckboxListTileText0),
            textAlignBar(_CheckboxListTileText1),
            CheckboxListTileDemo.CheckboxListTileDefault(context.widget,that),// CheckboxListTile 不能放在 Row 里...
            textAlignBar(_CheckboxListTileText2),
            CheckboxListTileDemo.CheckboxListTileStateDefault(),
            SizedBox(height: 20.0),
          ])
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt) {
  return new Align(
      alignment: FractionalOffset.centerLeft,
      child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            MarkdownBody(data: txt)
          ])
  );
}

