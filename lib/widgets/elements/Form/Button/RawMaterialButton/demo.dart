/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/11/22
 * Time: 上午12:03
 * email: zhu.yan@alibaba-inc.com
 * tartget: RawMaterialButton 的示例
 */
import 'dart:math';
import 'package:flutter/material.dart';

/*
* RawMaterialButton 默认按钮的实例
* isDisabled:是否是禁用，isDisabled 默认为true
* */
class RawMaterialButtonDefault extends StatelessWidget {
  final bool isDisabled;

  const RawMaterialButtonDefault([ this.isDisabled = true])
      : assert(isDisabled != null),
        super();

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        // 文本内容
        child: const Text('默认按钮', semanticsLabel: 'FLAT BUTTON 1'),
        onPressed: isDisabled ? () {} : null);
  }
}

/*
* RawMaterialButton 自定义的实例
* */
class RawMaterialButtonCustom extends StatelessWidget {
  final String txt;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const RawMaterialButtonCustom(
      [ this.txt = '自定义按钮',
       this.color = Colors.blueAccent,
       this.shape,
       this.onPressed])
      : super();

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    final _fontSize = (Random.secure().nextInt(10)+15).toDouble();
    return RawMaterialButton(
        // 使用Material.textStyle为按钮的子项定义默认文本样式。
        textStyle:TextStyle(color: _randomColor(),fontSize: _fontSize),
        // 定义形状和高程的动画更改的持续时间
        animationDuration:Duration(seconds: 1),
        // 文本内容
        child: Text(txt, semanticsLabel: 'FLAT BUTTON 2'),
        // 高亮时的背景色
        highlightColor: Colors.yellow,
        // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
        splashColor: _randomColor(),
        // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
        clipBehavior: Clip.antiAlias,
        padding: new EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
        //高亮时候的阴影
        highlightElevation: 10.0,
        // 按钮材质的形状
        // shape: shape,
        // RawMaterialButton 的点击事件
        onPressed: () {
          // Perform some action
          if (_onPressed is VoidCallback) {
            _onPressed();
          }
        });
  }
}

Color _randomColor() {
  var red = Random.secure().nextInt(255);
  var greed = Random.secure().nextInt(255);
  var blue = Random.secure().nextInt(255);
  return Color.fromARGB(255, red, greed, blue);
}
