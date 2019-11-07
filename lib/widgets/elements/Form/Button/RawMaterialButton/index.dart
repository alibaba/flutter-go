/// Created with FlutterGo.
/// User: 一晟
/// Date: 2018/11/14
/// Time: 下午4:31
/// email: zhu.yan@alibaba-inc.com
/// target: RawMaterialButton 的示例
/// 对应文档地址:https://docs.flutter.io/flutter/material/RawMaterialButton-class.html

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart' as rawMaterialButton;

const String _rawMaterialText0 = """### **简介**
> RawMaterial button “RawMaterial 按钮”
- 基于 Semantics，Material 和InkWell 小部件创建按钮;
- 此类不使用当前 Theme 或 ButtonTheme 来计算未指定参数的默认值。它旨在用于自定义 Material button，可选择包含主题或特定于应用程序源的默认值;
""";

const String _rawMaterialText1 = """### **基本用法**
> 参数的默认的 button 和禁用 button
""";

const String _rawMaterialText2 = """### **进阶用法**
> 更改项参数的自定义
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/RawMaterialButton';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String buttonShapeType = 'border'; // 边框类型
  void setButtonShapeType() {
    //String _buttonShapeType = (buttonShapeType == 'border') ? 'radius' : 'border';
    if (mounted) {
      this.setState(() {
        //buttonShapeType = _buttonShapeType;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'RawMaterialButton',
      codeUrl: 'elements/Form/Button/RawMaterialButton/demo.dart',
      contentList: allRawMaterialButtons(context, this),
      docUrl:
          'https://docs.flutter.io/flutter/material/RawMaterialButton-class.html',
    );
  }
}

// 所有的 RawMaterialButton 按钮
List allRawMaterialButtons(BuildContext context, _DemoState that) {
  final ShapeBorder buttonShape = drawShape(that.buttonShapeType);
  return [
    _rawMaterialText0,
    _rawMaterialText1,
    ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        rawMaterialButton.RawMaterialButtonDefault(),
        SizedBox(width: 20.0), // 间距
        rawMaterialButton.RawMaterialButtonDefault(false),
      ],
    ),
    _rawMaterialText2,
    SizedBox(height: 10.0),
    rawMaterialButton.RawMaterialButtonCustom('主要按钮', Colors.blue, buttonShape),
    SizedBox(height: 10.0),
    rawMaterialButton.RawMaterialButtonCustom(
        '成功按钮', Colors.green, buttonShape),
    SizedBox(height: 10.0),
    rawMaterialButton.RawMaterialButtonCustom('信息按钮', Colors.grey, buttonShape),
    SizedBox(height: 10.0),
    rawMaterialButton.RawMaterialButtonCustom(
        '警告按钮', Colors.orange, buttonShape),
    SizedBox(height: 10.0),
    rawMaterialButton.RawMaterialButtonCustom('危险按钮', Colors.pink, buttonShape),
    SizedBox(height: 10.0),
    rawMaterialButton.RawMaterialButtonCustom('点击切换，观察字体变化', Colors.blue,
        buttonShape, () => that.setButtonShapeType()),
    SizedBox(height: 20.0)
  ];
}

// 绘制边框信息,比如是否有边框,是否是圆角
ShapeBorder drawShape(String type) {
  final Color _color = _randomColor();
  final borderWidth = Random.secure().nextInt(5).toDouble();
  final radiusWidth = Random.secure().nextInt(50).toDouble();

  switch (type) {
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
        side: BorderSide(
          // 保留原来的边框样式
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
