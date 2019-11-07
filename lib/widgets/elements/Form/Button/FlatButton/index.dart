/// Created with FlutterGo.
/// User: 一晟
/// Date: 2018/11/14
/// Time: 下午4:31
/// email: zhu.yan@alibaba-inc.com
/// target: FlatButton 的示例
/// 对应文档地址:https://docs.flutter.io/flutter/material/FlatButton-class.html

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';

import './demo.dart' as flatButton;

const String _flatText0 = """### **简介**
> FlatButton 是显示在（零高程）material widget 上的文本标签
- 通过填充颜色对触摸作出反应在工具栏上；
- FlatButtons 故意不具有可见边框，因此必须依赖于它们相对于其他内容的位置以用于上下文；
- 在对话框和卡片中，它们应该组合在一个底角中。避免使用平面按钮，它们会与其他内容混合，例如在列表中间；""";

const String _flatText1 = """### **基本用法**
> 参数的默认的 button 和禁用 button
- 如果 onPressed 回调为null，则该按钮将被禁用，不会对触摸做出反应，并且将按 disabledColor 属性而不是color属性指定的颜色进行着色；
- 如果您尝试更改按钮的颜色并且没有任何效果，请检查您是否正在传递非null onPressed处理程序；。""";

const String _flatText2 = """### **进阶用法1**
> FlatButton.icon ，button 图标和标签的 widget 创建文本按钮；""";

const String _flatText3 = """### **进阶用法2**
> 更改参数的自定义,比如:边框，点击效果，内容文字颜色等；
- 要使应用程序的一部分具有交互式，使用 ink splashes，请考虑使用InkWell;
- Flat button 的最小尺寸为88.0×36.0，可以用 ButtonTheme 覆盖。该clipBehavior参数不能为空;""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/FlatButton';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'FlatButton',
      codeUrl: 'elements/Form/Button/FlatButton/demo.dart',
      contentList: allFlatButtons(context),
      docUrl: 'https://docs.flutter.io/flutter/material/FlatButton-class.html',
    );
  }
}

// 所有的 FlatButton 按钮
List allFlatButtons(BuildContext context) {
  return [
    _flatText0,
    _flatText1,
    ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        flatButton.FlatButtonDefault(),
        SizedBox(width: 20.0), // 间距
        flatButton.FlatButtonDefault(false),
      ],
    ),
    _flatText2,
    ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        flatButton.FlatButtonIconDefault(),
        flatButton.FlatButtonIconDefault(false),
      ],
    ),
    ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        flatButton.FlatButtonIconDefault(true, Icons.android),
        flatButton.FlatButtonIconDefault(true, Icons.announcement),
      ],
    ),
    _flatText3,
    //flatButton.FlatButtonCustom(context,'主要按钮',Colors.blue),
    flatButton.FlatButtonCustom('主要按钮', Colors.blue),
    SizedBox(height: 10.0),
    flatButton.FlatButtonCustom('成功按钮', Colors.green),
    SizedBox(height: 10.0),
    flatButton.FlatButtonCustom('信息按钮', Colors.grey),
    SizedBox(height: 10.0),
    flatButton.FlatButtonCustom('警告按钮', Colors.orange),
    SizedBox(height: 10.0),
    flatButton.FlatButtonCustom('危险按钮', Colors.pink),
    SizedBox(height: 10.0),
    flatButton.FlatButtonCustom(
        '点击我试试！',
        Colors.red,
        Border.all(color: Colors.brown, width: 5.0, style: BorderStyle.solid),
        () => _showMessage('点击了 FLAT BUTTON ', context)),
    SizedBox(height: 20.0)
  ];
}

// alert 弹框
// context:容器的父级
void _showMessage(String name, BuildContext context) {
  showDialog(
      // alert 的父级
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('提示'),
            content: Text(name),
            actions: <Widget>[
              FlatButton(
                  // alert 的取消按钮
                  onPressed: () {
                    // 取消的事件
                    Navigator.of(context).pop(true);
                  },
                  child: Text('取消'))
            ]);
      });
}
