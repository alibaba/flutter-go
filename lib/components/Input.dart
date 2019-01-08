import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({Key key, this.active}):super(key: key);
  
  String active;
  TextEditingController controller;
  
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(top:100.0),
          child: new Text('这是一个组件')
        ),
        new Container(
          decoration: new BoxDecoration(border: new Border.all(width:1.0,color: Colors.blue)),
          padding: new EdgeInsets.all(20.0),
          child: new Text('来自输入框:'+active)
        )
      ],
    );
  }

}