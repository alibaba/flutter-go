/// Created with 菜鸟手册.
/// User: 一晟
/// Date: 2018/11/14
/// Time: 下午4:31
/// email: zhu.yan@alibaba-inc.com
/// target: RaisedButton 的示例
/// 对应文档地址:https://docs.flutter.io/flutter/material/RaisedButton-class.html


import 'package:flutter_markdown/flutter_markdown.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as raisedButton;


const String _raisedText0 =
"""### **简介**
> Raised button “凸起按钮”
- Raised button 基于  a Material widget 窗口widget，按下 button 时，Material.elevation 会增加;
- 使用 Raised button 可将尺寸添加到大多数平面布局中;
- 例如在复杂的内容列表中，或在宽阔的空间中。避免在已经提出的内容（例如对话框或卡片）上使用 Raised button;
""";

const String _raisedText1 =
"""### **基本用法**
> 参数的默认的 button 和禁用 button;
- 如果onPressed回调为null，则该按钮将被禁用，不会对触摸做出反应，并且将按 disabledColor 属性而不是color属性指定的颜色进行着色;
- 如果您尝试更改按钮的颜色并且没有任何效果，请检查您是否正在传递非null onPressed处理程序;""";


const String _raisedText2 =
"""### **进阶用法1**
> RaisedButton.icon 的用方法，按钮图标和标签的widget创建文本按钮;""";

const String _raisedText3 =
"""### **进阶用法2**
> 更改项参数的自定义,比如:边框，点击效果，内容文字,颜色,圆角等
- 如果您想要 ink-splash  的墨水效果，但又不想使用按钮，请考虑直接使用InkWell;
- Raised buttons 的最小尺寸为88.0×36.0，可以用 ButtonTheme 覆盖;
- 通过 shape 属性的设置，改变边框样式和圆角;
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/RaisedButton';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String buttonShapeType = 'border'; // 边框类型
  void setButtonShapeType(){
    String _buttonShapeType = (buttonShapeType == 'border') ? 'radius' : 'border';
    if(mounted) {
      this.setState(() {
        buttonShapeType = _buttonShapeType;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'RaisedButton',
      codeUrl: 'elements/Form/Button/RaisedButton/demo.dart',
      contentList: [allRaisedButtons(context,this)],
      docUrl: 'https://docs.flutter.io/flutter/material/RaisedButton-class.html',
    );
  }
}

 // 所有的 RaisedButton 按钮
Widget allRaisedButtons(BuildContext context,_DemoState that){
  final ShapeBorder buttonShape = drawShape(that.buttonShapeType);
  return Container(
    //padding:  EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _raisedText0),
            textAlignBar(_raisedText1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                raisedButton.RaisedButtonDefault(),
                SizedBox(width: 20.0), // 间距
                raisedButton.RaisedButtonDefault(false),
              ],
            ),
            textAlignBar(_raisedText2),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                raisedButton.RaisedButtonIconDefault(),
                raisedButton.RaisedButtonIconDefault(false),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                raisedButton.RaisedButtonIconDefault(true, Icons.android),
                raisedButton.RaisedButtonIconDefault(true, Icons.announcement),
              ],
            ),
            textAlignBar(_raisedText3),
            SizedBox(height: 10.0),
            raisedButton.RaisedButtonCustom('主要按钮',Colors.blue,buttonShape),
            SizedBox(height: 10.0),
            raisedButton.RaisedButtonCustom('成功按钮',Colors.green,buttonShape),
            SizedBox(height: 10.0),
            raisedButton.RaisedButtonCustom('信息按钮',Colors.grey,buttonShape),
            SizedBox(height: 10.0),
            raisedButton.RaisedButtonCustom('警告按钮',Colors.orange,buttonShape),
            SizedBox(height: 10.0),
            raisedButton.RaisedButtonCustom('危险按钮',Colors.pink,buttonShape),
            SizedBox(height: 10.0),
            raisedButton.RaisedButtonCustom( '点击切换，按钮的圆角', Colors.blue, buttonShape,
                    () => that.setButtonShapeType()),
            SizedBox(height: 20.0)
          ])
  );
}

  // alert 弹框
  // context:容器的父级
// void _showMessage(String name, BuildContext context) {
//   showDialog(
//     // alert 的父级
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//           title:  Text('提示'),
//           content:  Text(name),
//           actions: <Widget>[
//              FlatButton(
//               // alert 的取消按钮
//                 onPressed: () {
//                   // 取消的事件
//                   Navigator.of(context).pop(true);
//                 },
//                 child:  Text('取消'))
//           ]);
//     }
//   );
// }

// 带align的text
Widget textAlignBar(String txt){
  //style:  TextStyle(fontSize: 15.5, height: 1.2),textAlign:TextAlign.left
  return  Align(
      alignment: FractionalOffset.centerLeft,
      child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            MarkdownBody(data: txt)
            // Text(txt, style:  TextStyle(fontSize: 15.5,height: 1.2,color:Colors.blue),textAlign:TextAlign.left)
          ])
  );
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

