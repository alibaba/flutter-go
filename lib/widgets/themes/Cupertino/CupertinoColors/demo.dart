/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 上午11:34
/// email: zhu.yan@alibaba-inc.com
/// target: CupertinoColors 的示例

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Checkbox 默认按钮的实例
/// index 当前checkbox 的索引值
class CupertinoColorsFullDefault extends StatefulWidget {
  const CupertinoColorsFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CupertinoColorsFullDefault();
}

/// CupertinoColors 默认的实例,有状态
class _CupertinoColorsFullDefault extends State {

  Widget setColorsView(cupertinoColors,String colorName){
    return Container(
        width: MediaQuery.of(context).size.width-100,
        padding: const EdgeInsets.all(10.0),
        child:Text(colorName,style:TextStyle(color:Colors.white)),
        decoration:BoxDecoration(color: cupertinoColors)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        setColorsView(CupertinoColors.activeBlue,'activeBlue'),
        setColorsView(CupertinoColors.activeGreen,'activeGreen'),
        setColorsView(CupertinoColors.black,'black'),
        setColorsView(CupertinoColors.destructiveRed,'destructiveRed'),
        setColorsView(CupertinoColors.inactiveGray,'inactiveGray'),
        setColorsView(CupertinoColors.lightBackgroundGray,'lightBackgroundGray'),
        setColorsView(CupertinoColors.white,'white')
      ],
    );
  }
}