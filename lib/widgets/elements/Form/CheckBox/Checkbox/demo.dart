/// Created with Android Studio.
/// User: 一晟
/// Date: 2018/11/22
/// Time: 上午12:03
/// email: zhu.yan@alibaba-inc.com
/// target: Checkbox 的示例

import 'dart:math';
import 'package:flutter/material.dart';

/// Checkbox 默认的实例
/// index 当前checkbox 的索引值
class CheckboxDefault extends StatefulWidget{
  final int index;
  final parent;
  const CheckboxDefault([this.parent, this.index = -1]) : super();
  @override
  State<StatefulWidget> createState() =>_CheckboxDefault();
}
class _CheckboxDefault extends State {
  bool isChecked=false;
  Color color = _randomColor(); // 注意和下面的 StatelessWidget 里的 _randomColor 区别
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: color,
        tristate:false,
        value: isChecked,
        onChanged: (bool bol) {
          if(mounted) {
            setState(() {
              isChecked = bol;
            });
          }
        }
    );
  }
}

/// Checkbox 默认的实例
/// index 当前checkbox 的索引值
class CheckboxSelect extends StatelessWidget {
  final int index;
  final widget;
  final parent;

  const CheckboxSelect([this.widget,this.parent, this.index = -1])
      : super();

  @override
  Widget build(BuildContext context) {
    Color color = _randomColor();
    return Checkbox(
        activeColor: color,
        tristate:false,
        value: parent.selectValue == this.index,
        onChanged: (bool bol) {
          if(parent.mounted) {
            parent.setState(() {
              parent.selectValue = bol ? this.index : -1;
            });
          }
        }
    );
  }
}

Color _randomColor() {
  var red = Random.secure().nextInt(255);
  var greed = Random.secure().nextInt(255);
  var blue = Random.secure().nextInt(255);
  return Color.fromARGB(255, red, greed, blue);
}
