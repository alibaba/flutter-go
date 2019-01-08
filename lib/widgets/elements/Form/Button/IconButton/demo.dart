/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/11/22
 * Time: 上午12:03
 * email: zhu.yan@alibaba-inc.com
 * tartget: IconButton 的示例
 */
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rookie_book/common/iconNames.dart';

final  int len = IconNames.Names.length;

/*
* IconButton 默认按钮的实例
* isDisabled:是否是禁用，isDisabled 默认为true
* */
class IconButtonDefault extends StatelessWidget {
  final bool isDisabled;

  const IconButtonDefault([bool this.isDisabled = true])
      : assert(isDisabled != null),
        super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        // 文本内容
        icon: Icon(Icons.volume_up),
        tooltip: 'Increase volume by 10%',
        onPressed: isDisabled ? () {} : null);
  }
}

/*
* IconButton 自定义的实例
* */
class IconButtonCustom extends StatelessWidget {
  final String txt;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const IconButtonCustom(
      [String this.txt = '自定义按钮',
      Color this.color = Colors.blueAccent,
      ShapeBorder this.shape,
      VoidCallback this.onPressed])
      : super();

   getIcons(){
    return Icons;
  }

  @override
  Widget build(BuildContext context) {
    final int iconIndex = Random.secure().nextInt(len);
    final IconData type = IconNames.Names[iconIndex];
    final _onPressed = onPressed;
    return IconButton(
        // 定义图标在IconButton中的定位方式,AlignmentGeometry 如果父Widget尺寸大于child Widget尺寸，这个属性设置会起作用，有很多种对齐方式。
        alignment:AlignmentDirectional.center,
        // 按钮颜色
        color: _randomColor(),
        // 如果图标被禁用，则用于按钮内图标的颜色。默认为当前主题的ThemeData.disabledColor
        disabledColor:_randomColor(),
        // 高亮时的背景色
        highlightColor: Colors.yellow,
        // 按钮内图标的大小
        icon:Icon(type),
        // 图标尺寸
        iconSize:(Random.secure().nextInt(20)+20).toDouble(), // 随机大小
        // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
        splashColor: _randomColor(),
        padding: new EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
        // 描述按下按钮时将发生的操作的文本
        tooltip:'这是${ type.codePoint }信息',
        // IconButton 的点击事件
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
