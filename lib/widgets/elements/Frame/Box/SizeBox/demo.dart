import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeBoxDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.0,
      height: 80.0,
      child: const Card(
        child: Text(
          'SizedBox',
          textDirection: TextDirection.rtl,
        ),
        margin: EdgeInsets.all(20.0),
        color: Color(0xFFEF9A9A),
      ),
    );
  }
}
