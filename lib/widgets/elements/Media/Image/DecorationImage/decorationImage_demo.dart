import 'package:flutter/material.dart';

class DecorationImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Container',
          style: TextStyle(color: Colors.red),
        ),
      ),
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        image: DecorationImage(
            image: AssetImage('assets/images/food02.jpeg'), fit: BoxFit.cover),
      ),
      margin: const EdgeInsets.only(top: 10.0),
    );
  }
}
