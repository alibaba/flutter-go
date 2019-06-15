import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(onPressed: () {}, child: Text('以下方式引入的demo'))
    );
  }
}
  