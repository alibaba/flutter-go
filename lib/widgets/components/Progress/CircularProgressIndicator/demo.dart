import 'package:flutter/material.dart';

class CircularDemo extends StatefulWidget {
  @override
  _CircularDemoState createState() => _CircularDemoState();
}

class _CircularDemoState extends State<CircularDemo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.redAccent,
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
