/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2018/12/23
 * Time: 下午6:08
 * email: zhu.yan@alibaba-inc.com
 * tartget: CheckboxListTile 的示例
 */

import 'package:flutter/material.dart';

/*
* Checkbox 默认按钮的实例
* index 当前checkbox 的索引值
* */
class CheckboxListTileStateDefault extends StatefulWidget {
  const CheckboxListTileStateDefault() : super();

  @override
  State<StatefulWidget> createState() => _CheckboxListTileStateDefault();
}

/*
* CheckboxListTile 默认的实例,有状态
* */
class _CheckboxListTileStateDefault extends State {
  bool _value = false;
  void _valueChanged(bool value) {
    for (var i = 0; i < isChecks.length; i++) {
      isChecks[i] = value;
    }
    setState(() => _value = value);
  }
  bool isCheck=false;
  List<bool> isChecks=[false,false,false,false];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Center(
          child: CheckboxListTile(
            value: _value,
            selected:true,// 默认文字是否高亮
            onChanged: _valueChanged,
            dense: false,// 文字是否对齐 图标高度
            isThreeLine: false,// 文字是否三行显示
            title:  Text('全部'), // 主标题
            controlAffinity: ListTileControlAffinity.trailing, // 将控件放在何处相对于文本,leading 按钮显示在文字后面,platform,trailing 按钮显示在文字前面
            subtitle:  Text('勾选下列全部结果'), // 标题下方显示的副标题
            secondary:  Icon(Icons.archive), // 从复选框显示在磁贴另一侧的小组件
            activeColor: Colors.red, // 选中此复选框时要使用的颜色
          ),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isChecks[0],
              title: new Text('选项1'),
              activeColor: _value ? Colors.red : Colors.green,
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool){
                setState(() {
                  isChecks[0]=bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isChecks[1],
              title: new Text('选项2'),
              activeColor: _value ? Colors.red : Colors.green,
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool){
                setState(() {
                  isChecks[1]=bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isChecks[2],
              title: new Text('选项3'),
              activeColor: _value ? Colors.red : Colors.green,
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool){
                setState(() {
                  isChecks[2]=bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isChecks[3],
              title: new Text('选项4'),
              activeColor: _value ? Colors.red : Colors.green,
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool){
                setState(() {
                  isChecks[3]=bool;
                });
              }),
        )
      ],
    );
  }
}

/*
* CheckboxListTile 默认的实例,无状态
* */
class CheckboxListTileDefault extends StatelessWidget {
  final widget;
  final parant;
  const CheckboxListTileDefault ([this.widget,this.parant])
      : super();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('一个简单的例子'),
      activeColor: Colors.red,
      value: widget.valBool,
        onChanged: (bool value) {
          parant.setState(()=> widget.valBool = value);
        },
        secondary: const Icon(Icons.hourglass_empty),
    );
  }
}