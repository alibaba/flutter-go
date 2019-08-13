/// Created with FlutterGo.
/// User: 一晟
/// Date: 2018/11/14
/// Time: 下午4:31
/// email: zhu.yan@alibaba-inc.com
/// target: OutlineButton 的示例
/// 对应文档地址:https://docs.flutter.io/flutter/material/OutlineButton-class.html

import 'dart:math';

import 'package:flutter_web/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as outlineButton;

const String _outlineText0 =
"""### **简介**
> Outline button “边框按钮”
- RaisedButton和FlatButton之间的交叉：一个有边框的按钮，当按下按钮时，其高度增加，背景变得不透明；
- 高程最初为0.0，其背景颜色 为透明。按下按钮时，其背景变为不透明，然后其高程增加到highlightElevation；
""";

const String _outlineText1 =
"""### **基本用法**
> 参数的默认的 button 和禁用 button
- 如果onPressed回调为null，则该按钮将被禁用，不会对触摸做出反应，并且将按 disabledColor 属性而不是color属性指定的颜色进行着色；
- 如果您尝试更改按钮的颜色并且没有任何效果，请检查您是否正在传递非null onPressed处理程序；""";


const String _outlineText2 =
"""### **进阶用法1**
> OutlineButton.icon 的用法，按钮图标和标签的widget创建文本按钮""";

const String _outlineText3 =
"""### **进阶用法2**
> 更改参数的自定义,比如:边框，点击效果，内容文字,颜色,圆角等；
- Outline buttons 按钮有一个边框，其形状由形状定义 ，其外观由borderSide，disabledBorderColor 和 highlightedBorderColor 定义；
- 如果您想要 ink-splash 效果，但又不想使用 button ，请考虑直接使用 InkWell；
- Outline buttons 的最小尺寸为88.0×36.0，可以用 ButtonTheme 覆盖；
- 通过 shape 属性的设置，改变边框样式和圆角;
- 可以尝试长按按钮，button 突出显示;
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/OutlineButton';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String buttonShapeType = 'border'; // 边框类型
  void setButtonShapeType(){
    String _buttonShapeType = (buttonShapeType == 'border') ? 'radius' : 'border';
    if (mounted) {
      this.setState(() {
        buttonShapeType = _buttonShapeType;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'OutlineButton',
      codeUrl: 'elements/Form/Button/OutlineButton/demo.dart',
      contentList: allOutlineButtons(context,this),
      docUrl: 'https://docs.flutter.io/flutter/material/OutlineButton-class.html',
    );
  }
}

 // 所有的 OutlineButton 按钮
List allOutlineButtons(BuildContext context,_DemoState that){
  final ShapeBorder buttonShape = drawShape(that.buttonShapeType);
  return [
    _outlineText0,
    _outlineText1,
    ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        outlineButton.OutlineButtonDefault(),
        SizedBox(width: 20.0), // 间距
        outlineButton.OutlineButtonDefault(false),
      ],
    ),
    _outlineText2,
    ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        outlineButton.OutlineButtonIconDefault(),
        outlineButton.OutlineButtonIconDefault(false),
      ],
    ),
    ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        outlineButton.OutlineButtonIconDefault(true, Icons.android),
        outlineButton.OutlineButtonIconDefault(true, Icons.announcement),
      ],
    ),
    _outlineText3,
    SizedBox(height: 10.0),
    outlineButton.OutlineButtonCustom('主要按钮', Colors.blue, buttonShape),
    SizedBox(height: 10.0),
    outlineButton.OutlineButtonCustom('成功按钮', Colors.green, buttonShape),
    SizedBox(height: 10.0),
    outlineButton.OutlineButtonCustom('信息按钮', Colors.grey, buttonShape),
    SizedBox(height: 10.0),
    outlineButton.OutlineButtonCustom('警告按钮', Colors.orange, buttonShape),
    SizedBox(height: 10.0),
    outlineButton.OutlineButtonCustom('危险按钮', Colors.pink, buttonShape),
    SizedBox(height: 10.0),
    outlineButton.OutlineButtonCustom(
        '点击切换，随机改变按钮的圆角,边框样式', Colors.blue, buttonShape,
            () => that.setButtonShapeType()),
    SizedBox(height: 20.0)
  ];
}

// 绘制边框信息,比如是否有边框,是否是圆角
ShapeBorder drawShape(String type){
  final Color _color = _randomColor();
  final borderWidth = Random.secure().nextInt(5).toDouble();
  final radiusWidth = Random.secure().nextInt(50).toDouble();

  switch(type){
    case 'border':
      return Border.all(
        // 设置边框样式
        width: borderWidth,
        color: _color,
        style: BorderStyle.solid,
      );
      break;
    case 'radius':
      return RoundedRectangleBorder(
        side: BorderSide( // 保留原来的边框样式
          width: borderWidth,
          color: _color,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radiusWidth),
          topLeft: Radius.circular(radiusWidth),
          bottomLeft: Radius.circular(radiusWidth),
          bottomRight: Radius.circular(radiusWidth),
        ),
      );
      break;
    default:
      return null;
  }
}

// 取随机颜色
Color _randomColor() {
  var red = Random.secure().nextInt(255);
  var greed = Random.secure().nextInt(255);
  var blue = Random.secure().nextInt(255);
  return Color.fromARGB(255, red, greed, blue);
}

