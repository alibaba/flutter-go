import 'package:flutter/material.dart';

class RotatedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RotatedBox(
          child: const Text('hello  flutter'),
          quarterTurns: 3,
        ),
        SizedBox(
          height: 20.0,
        ),
        RotatedBox(
          child: const Text('hello  flutter'),
          quarterTurns: 8,
        )
      ],
    );
  }
}
