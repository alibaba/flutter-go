import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LimitedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: 50.0,
      maxHeight: 150.0,
      child: Container(
        width: 250.0,
        height: 150.0,
        color: Colors.red,
      ),
    );
  }
}
