import 'package:flutter/material.dart';

class ExactAssetImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: ExactAssetImage('assets/images/food02.jpeg', scale: 1.5),
        ),
        SizedBox(
          height: 20.0,
        ),
        Image(
          image: ExactAssetImage('assets/images/food02.jpeg', scale: 1.0),
        ),
      ],
    );
  }
}
