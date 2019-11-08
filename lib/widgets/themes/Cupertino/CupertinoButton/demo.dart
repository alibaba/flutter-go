/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 上午11:34
/// email: zhu.yan@alibaba-inc.com
/// target: CupertinoButton 的示例

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Checkbox 默认按钮的实例
// index 当前checkbox 的索引值
class CupertinoButtonFullDefault extends StatefulWidget {
  const CupertinoButtonFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CupertinoButtonFullDefault();
}

// CupertinoButton 默认的实例,有状态
class _CupertinoButtonFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      onPressed: () {
        print('on Pressed!');
      },
      pressedOpacity: 0.5, // 按下后的按钮不透明度
      color: CupertinoColors.inactiveGray,
      child: new Text('CupertinoButton'),
    );
  }
}
