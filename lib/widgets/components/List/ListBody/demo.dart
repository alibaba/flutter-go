/// Created with Android Studio.
/// User: 一晟
/// Date: 2018/12/31
/// Time: 下午2:42
/// email: zhu.yan@alibaba-inc.com
/// target: ListBody 的示例

import 'package:flutter/material.dart';

/// Checkbox 默认ListBody的实例
class ListBodyFullDefault extends StatefulWidget {
  const ListBodyFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _ListBodyFullDefault();
}

/// ListBody 默认的实例,有状态
class _ListBodyFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return ListBody(
        // ...  // 如果没有,就是不需要有状态的 StatefulWidget
        );
  }
}

/// ListBody 默认的实例,无状态
class ListBodyLessDefault extends StatelessWidget {
  final widget;
  final parent;

  const ListBodyLessDefault([this.widget, this.parent]) : super();

  @override
  Widget build(BuildContext context) {
    return ListBody(
      mainAxis: Axis.vertical, // 排列的主轴方向
      reverse: false, // 是否反向
      children: <Widget>[
        Container(
            color: Colors.red,
            width: 50.0,
            height: 150.0,
            child: Text('标题1', style: TextStyle(color: Color(0xffffffff)))),
        Container(
            color: Colors.yellow,
            width: 50.0,
            height: 50.0,
            child: Text('标题2', style: TextStyle(color: Color(0xffffffff)))),
        Container(
            color: Colors.green,
            width: 50.0,
            height: 50.0,
            child: Text('标题3', style: TextStyle(color: Color(0xffffffff)))),
        Container(
            color: Colors.blue,
            width: 50.0,
            height: 50.0,
            child: Text('标题4', style: TextStyle(color: Color(0xffffffff)))),
        Container(
            color: Colors.black,
            width: 50.0,
            height: 50.0,
            child: Text('标题5', style: TextStyle(color: Color(0xffffffff))))
      ],
    );
  }
}
