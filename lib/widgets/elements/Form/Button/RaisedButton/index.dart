import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/RaisedButton';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FlatButton"),
        ),
        body: Container(
            child: RaisedButton(onPressed: () {}, child: Text("BUtton"))
        )
    );

  }
}
