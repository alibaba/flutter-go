import 'package:flutter/material.dart';

class AssetImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/food01.jpeg'),
        ),
        Container(
          child: Image(
            image: AssetImage('assets/images/food02.jpeg'),
            height: 300.0,
            width: 300.0,
          ),
        )
      ],
    );
  }
}
