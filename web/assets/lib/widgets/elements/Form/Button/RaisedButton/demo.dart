/// Created with Android Studio.
/// User: 一晟
/// Date: 2018/11/22
/// Time: 上午12:03
/// email: zhu.yan@alibaba-inc.com
/// target: RaisedButton 的示例

import 'dart:math';
import 'package:flutter_web/material.dart';

// RaisedButton 默认按钮的实例
// isDisabled:是否是禁用，isDisabled 默认为true
class RaisedButtonDefault extends StatelessWidget {
  final bool isDisabled;

  const RaisedButtonDefault([ this.isDisabled = true])
      : assert(isDisabled != null),
        super();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        // 文本内容
        child: const Text('默认按钮', semanticsLabel: 'FLAT BUTTON 1'),
        onPressed: isDisabled ? () {} : null);
  }
}

// RaisedButton.icon 默认按钮的实例
// Create a text button from a pair of widgets that serve as the button's icon and label
// isDisabled:是否是禁用
class RaisedButtonIconDefault extends StatelessWidget {
  final bool isDisabled;
  final IconData icon;

  const RaisedButtonIconDefault(
      [ this.isDisabled = true,  this.icon = Icons.add_circle])
      : super();

  Color _randomColor() {
    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        // 文本内容
        icon: Icon(icon, size: 25.0, color: _randomColor()),
        label: Text('默认按钮', semanticsLabel: 'FLAT BUTTON 2'),
        onPressed: isDisabled
            ? () {
                //_showMessage('点击了 FLAT BUTTON ', context);
              }
            : null);
  }
}


// RaisedButton 自定义的实例
class RaisedButtonCustom extends StatelessWidget {
  final String txt;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const RaisedButtonCustom(
      [ this.txt = '自定义按钮',
       this.color = Colors.blueAccent,
       this.shape,
       this.onPressed])
      : super();

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    return RaisedButton(
        // 文本内容
        child: Text(txt, semanticsLabel: 'FLAT BUTTON 2'),
        // 按钮颜色
        color: color,
        // 按钮亮度
        colorBrightness: Brightness.dark,
        // 高亮时的背景色
        //highlightColor: Colors.yellow,
        // 失效时的背景色
        disabledColor: Colors.grey,
        // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色时才会起作用
        textColor: Colors.white,
        // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会起作用
        disabledTextColor: Colors.grey,
        // 按钮主题,主要用于与ButtonTheme和ButtonThemeData一起使用来定义按钮的基色,RaisedButton，RaisedButton，OutlineButton，它们是基于环境ButtonTheme配置的
        //ButtonTextTheme.accent，使用模版颜色的;ButtonTextTheme.normal，按钮文本是黑色或白色取决于。ThemeData.brightness;ButtonTextTheme.primary，按钮文本基于。ThemeData.primaryColor.
        textTheme: ButtonTextTheme.normal,
        // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
        splashColor: Colors.deepPurple,
        // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
        clipBehavior: Clip.antiAlias,
        padding:
             EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
        shape: (shape is ShapeBorder)
            ? shape
            :  Border.all(
                // 设置边框样式
                color: Colors.grey,
                width: 2.0,
                style: BorderStyle.solid,
              ),
        // RaisedButton 的点击事件
        onPressed: () {
          // Perform some action
          if (_onPressed is VoidCallback) {
            _onPressed();
          }
        },
        // 改变高亮颜色回掉函数，一个按钮会触发两次，按下后改变时触发一次，松手后恢复原始颜色触发一次
        // 参数 bool，按下后true，恢复false
        onHighlightChanged: (isClick) {
          print(isClick);
        });
  }
}
