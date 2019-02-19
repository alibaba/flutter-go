 /// @Author: 一凨 
 /// @Date: 2019-01-07 15:33:49 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2019-01-07 15:45:29
import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/food05.jpeg',
        fit: BoxFit.contain,
      ),
      height: 300.0,
      width: 300.0,
    );
  }
}
