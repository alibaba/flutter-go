/**
 * Created with 菜鸟手册.
 * User: 一晟
 * Date: 2018/11/14
 * Time: 下午4:31
 * email: zhu.yan@alibaba-inc.com
 * target: IconButton 的示例
 * 对应文档地址:https://docs.flutter.io/flutter/material/IconButton-class.html
 */
import 'package:flutter_go/components/widget_demo.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as iconButton;


const String _iconText0 =
"""### **简介**
> Icon button “图标按钮”
- IconButton widget上的图片，通过填充颜色（墨水）来对触摸作出反应;
""";

const String _iconText1 =
"""### **基本用法**
> 参数的默认的按钮和禁用按钮
- 图标按钮通常在AppBar.actions字段中使用，但它们也可以在许多其他地方使用;
- 如果您尝试更改按钮的颜色并且没有任何效果，请检查您是否正在传递非null onPressed处理程序;""";

const String _iconText2 =
"""### **进阶用法**
> 更改项参数的自定义,比如:边框，点击效果，内容文字,颜色,圆角等;
- 如果可能，图标按钮的命中区域的大小至少为48.0像素，与实际的iconSize无关，以满足 Material Design规范中的触摸目标大小要求。的对准控制图标本身如何定位命中区域内;
- ** 长按可弹出 tip 文字 **
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/IconButton';

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
      title: 'IconButton',
      codeUrl: 'elements/Form/Button/IconButton/demo.dart',
      contentList: [ allIconButtons(context,this)],
      docUrl: 'https://docs.flutter.io/flutter/material/IconButton-class.html',
    );
  }
}

/*
 * 所有的 IconButton 按钮
 */
Widget allIconButtons(BuildContext context,_DemoState that){
  final ShapeBorder buttonShape = drawShape(that.buttonShapeType);
  return Container(
    //padding:  EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _iconText0),
            textAlignBar(_iconText1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                iconButton.IconButtonDefault(),
                SizedBox(width: 20.0), // 间距
                iconButton.IconButtonDefault(false),
              ],
            ),
            textAlignBar(_iconText2),
            SizedBox(height: 10.0),
            iconButton.IconButtonCustom('主要按钮',Colors.blue,buttonShape),
            SizedBox(height: 10.0),
            iconButton.IconButtonCustom('成功按钮',Colors.green,buttonShape),
            SizedBox(height: 10.0),
            iconButton.IconButtonCustom('信息按钮',Colors.grey,buttonShape),
            SizedBox(height: 10.0),
            iconButton.IconButtonCustom('警告按钮',Colors.orange,buttonShape),
            SizedBox(height: 10.0),
            iconButton.IconButtonCustom('危险按钮',Colors.pink,buttonShape),
            SizedBox(height: 10.0),
            RaisedButton(
              // 文本内容
                child: const Text('点击切换，图标按钮', semanticsLabel: 'FLAT BUTTON 1'),
                onPressed: ()=> that.setButtonShapeType()),
            SizedBox(height: 20.0)
          ])
  );
}

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

