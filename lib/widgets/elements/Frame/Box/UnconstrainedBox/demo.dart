import 'package:flutter/material.dart';

class UnconstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      textDirection: TextDirection.rtl,
      child: new Row(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            color: Color(0xfff48fb1),
            child: Text(
              "data",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
