import 'dart:async';

import 'package:flutter/material.dart';
import '../common/eventBus.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.data2ThirdPage, this.callback}) : super(key: key);
  final callback;
  String data2ThirdPage;

  @override
  ThirdPageState createState() => new ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {

  String data = '';
  String inputTxt;
  TextEditingController controller = new TextEditingController();

  void initState() {
    //print('data4Two' + widget.data2ThirdPage);
    data = widget.data2ThirdPage;
  }

  void firedA() {
    widget.callback('$inputTxt');
  }

  void firedB() {
    eventBus.fire(new MyEvent('$inputTxt'));
  }

  void _onChanged(String value) {
    setState(() {
      inputTxt = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    print('===========>>>:123123123123');
    return new Center(
        child: new Column(children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(bottom: 15.0),
            child: new Text('子组件2'),
          ),
          new Container(
            padding: new EdgeInsets.only(bottom: 10.0),
            child: new Text('父传子:' + data),
          ),
          new Container(
              margin: new EdgeInsets.only(bottom: 40.0),
              child: new TextField(
                  controller: controller,
                  onChanged: _onChanged,
                  decoration: (new InputDecoration(labelText: '请输入你要发送的值')))),
          new Container(
              child: new RaisedButton(
                  onPressed: firedA, child: new Text('to父组件'))),
          new Container(
              child: new RaisedButton(
                  onPressed: firedB, child: new Text('to兄弟组件')))
        ]
        )
    );
  }
}
