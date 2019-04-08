/// Created with Android Studio.
/// User: 一晟
/// Date: 2018/12/23
/// Time: 下午6:07
/// email: zhu.yan@alibaba-inc.com
/// target: CheckboxListTile 的示例

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as CheckboxListTileDemo;

const String _CheckboxListTileText0 =
"""### **简介**
> CheckboxListTile “下拉复选框”
- 带有复选框的 ListTile,带有标签的 ListTile；
- 整个列表图块是交互式的：点击图块中的任意位置可切换复选框；
""";


const String _CheckboxListTileText1 =
"""### **基本用法**
> CheckboxListTile 的属性特征
- 与 Checkbox 类似的命名属性，比如：onChanged 和 activeColor；
- 和 ListTile 类似的命名属性，比如：title, subtitle, isThreeLine，dense；
- selected 属性和 ListTile.selected 属性类似，但使用的颜色是 activeColor 属性，默认为当前 Theme 的颜色；
- onChanged 回调函数为 null,显示禁用；
""";

const String _CheckboxListTileText2 =
"""### **进阶用法**
> CheckboxListTile 单选和全选的示例 
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Checkbox/CheckboxListTile';
  final Map<String,bool> valBool = {'val':true};
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CheckboxListTile',
      codeUrl: 'elements/Form/CheckBox/CheckboxListTile/demo.dart',
      contentList: allCheckboxs(context, this),
      docUrl: 'https://docs.flutter.io/flutter/material/CheckboxListTile-class.html',
    );
  }
}

 // 所有的 CheckboxListTile widget
 // context: 运行上下文
 // that: 指向有状态的 StatefulWidget
List allCheckboxs(BuildContext context, _DemoState that) {
  return [
    _CheckboxListTileText0,
    _CheckboxListTileText1,
    CheckboxListTileDemo.CheckboxListTileDefault(context.widget, that),
    // CheckboxListTile 不能放在 Row 里...
    _CheckboxListTileText2,
    CheckboxListTileDemo.CheckboxListTileStateDefault(),
    SizedBox(height: 20.0),
  ];
}

