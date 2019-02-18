/// Created with 菜鸟手册.
/// User: 一晟
/// Date: 2018/11/14
/// Time: 下午4:31
/// email: zhu.yan@alibaba-inc.com
/// target: FloatingActionButton 的示例
/// 对应文档地址:https://docs.flutter.io/flutter/material/FloatingActionButton-class.html

import 'package:flutter_go/components/widget_demo.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as floatingActionButton;


const String _floatingActionText0 =
"""### **简介**
> FloatingAction Button “浮动动作按钮”
- FloatingActionButton 按钮是一个圆形图标按钮，悬停在内容上以提升应用程序中的主要操作。浮动操作按钮最常用于Scaffold.floatingActionButton字段中;
- 每个屏幕最多使用一个浮动操作按钮。浮动操作按钮应用于积极操作，例如“创建”，“共享”或“导航”;
- 一般用来处理界面中最常用，最基础的用户动作。它一般出现在屏幕内容的前面，通常是一个圆形，中间有一个图标。 FAB有三种类型：regular, mini, extended。不要强行使用FAB，只有当使用场景符合FAB功能的时候使用才最为恰当;
""";

const String _floatingActionText1 =
"""### **基本用法**
> 默认参数的 button 和禁用 button 
- 如果 onPressed 回调为null，则该 button 将被禁用，并且不会对触摸作出反应,不会变成灰色;
""";

const String _floatingActionText2 =
"""### **进阶用法1**
> 更改项参数的自定义,比如:边框，点击效果，内容文字,颜色,圆角等
""";

const String _floatingActionText3 =
"""### **进阶用法2**
> 更改项参数的自定义,比如:边框，点击效果，内容文字,颜色,圆角等
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/FloatingActionButton';

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
      title: 'FloatingActionButton',
      // desc: _floatingActionTitle,
      codeUrl: 'elements/Form/Button/FloatingActionButton/demo.dart',
      contentList: [allFloatingActionButtons(context,this)],
      docUrl: 'https://docs.flutter.io/flutter/material/FloatingActionButton-class.html',
    );
  }
}

/*
 * 所有的 FloatingActionButton 按钮
 */
Widget allFloatingActionButtons(BuildContext context,_DemoState that){
  final ShapeBorder buttonShape = drawShape(that.buttonShapeType);
  return Container(
    //padding:  EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _floatingActionText0),
            textAlignBar(_floatingActionText1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                floatingActionButton.FloatingActionButtonDefault(),
                SizedBox(width: 20.0), // 间距
                floatingActionButton.FloatingActionButtonDefault(false),
              ],
            ),
            textAlignBar(_floatingActionText2),
            SizedBox(height: 10.0),
              floatingActionButton.FloatingActionButtonCustom('主要按钮',Colors.deepOrangeAccent,buttonShape),
            SizedBox(height: 20.0),
            textAlignBar(_floatingActionText3),
            SizedBox(height: 20.0),
              floatingActionButton.FloatingActionButtonCustom2('扩展按钮',Colors.deepOrangeAccent,buttonShape),
            SizedBox(height: 20.0)
          ])
  );
}

/*
  * alert 弹框
  * context:容器的父级
  * */
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

/*
* 带align的text
* */
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

/*
* 绘制边框信息,比如是否有边框,是否是圆角
* */
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

/*
* 取随机颜色
* */
Color _randomColor() {
  var red = Random.secure().nextInt(255);
  var greed = Random.secure().nextInt(255);
  var blue = Random.secure().nextInt(255);
  return Color.fromARGB(255, red, greed, blue);
}

