/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午11:11
/// email: zhu.yan@alibaba-inc.com
/// target: ButtonBar 的示例

import 'package:flutter/material.dart';

// ButtonBar 默认的实例
class ButtonBarFullDefault extends StatefulWidget {
  const ButtonBarFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _ButtonBarFullDefault();
}

// ButtonBar 默认的实例,有状态
class _ButtonBarFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      // ...  // 如果没有,就是不需要有状态的 StatefulWidget
    );
  }
}

// ButtonBar 默认的实例,无状态
class ButtonBarLessDefault extends StatelessWidget {
  final widget;
  final parent;

  const ButtonBarLessDefault([this.widget, this.parent])
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:  EdgeInsets.symmetric(vertical: 0.0),
        height: 100.0,
        child:  Scrollbar(child:ListView(
            scrollDirection: Axis.horizontal, // 水平listView
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround, //布局方向，默认MainAxisAlignment.end
                mainAxisSize: MainAxisSize.max, //主轴大小，默认MainAxisSize.max
                children: <Widget>[ // Button集合
                  RaisedButton(child: Text('ButtonBar1'),color: Colors.red,onPressed: ()=>{},),
                  RaisedButton(child: Text('ButtonBar2'),color: Colors.red,onPressed: ()=>{},),
                  RaisedButton(child: Text('ButtonBar3'),color: Colors.red,onPressed: ()=>{},),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end, //布局方向，默认MainAxisAlignment.end
                mainAxisSize: MainAxisSize.min, //主轴大小，默认MainAxisSize.max
                children: <Widget>[ // Button集合
                  RaisedButton(child: Text('ButtonBar1'),color: Colors.yellow,onPressed: ()=>{},),
                  RaisedButton(child: Text('ButtonBar2'),color: Colors.yellow,onPressed: ()=>{},),
                  RaisedButton(child: Text('ButtonBar3'),color: Colors.yellow,onPressed: ()=>{},),
                ],
              )
            ]
        )
    ));
  }
}