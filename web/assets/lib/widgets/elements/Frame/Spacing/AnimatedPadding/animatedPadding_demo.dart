 /// @Author: 一凨 
 /// @Date: 2018-11-28 20:42:40 
 /// @Last Modified by:   一凨 
 /// @Last Modified time: 2018-11-28 20:42:40 

import 'package:flutter_web/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  double paddingValue;

  void initState() {
    super.initState();
    paddingValue = 10.0;
  }

  _changePadding() {
    if (paddingValue == 10.0) {
      setState(() {
        paddingValue = 100.0;
      });
    } else {
      setState(() {
        paddingValue = 10.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedPadding(
          padding: EdgeInsets.symmetric(
              horizontal: paddingValue, vertical: paddingValue),
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: Container(
            height: 200.0,
            color: Colors.blueAccent,
          ),
        ),
        RaisedButton(
          onPressed: _changePadding,
          child: Text('change padding'),
        )
      ],
    );
  }
}
