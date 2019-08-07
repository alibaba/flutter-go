
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControlDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CupertinoSegmentedControlDemo> {
  String value = 'a';
  @override
  Widget build(BuildContext context) {
    return  CupertinoSegmentedControl(
      onValueChanged: (v) {
        this.setState(() {
           value = v;
        });
      },
      pressedColor: Color(0xff7c1c25),
      borderColor: Color(0xffac172a),
      selectedColor: Color(0xffac172a),
      groupValue: value,
      children: {
        'a': Container(
          alignment: Alignment.center,
          width: 130.0,
          child: Text('a')
        ),
        'c': Text('C'),
        'b': Text('B'),
      },
    );
  }

}

