import 'package:flutter_web/material.dart';

class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 2.0,
      heightFactor: 2.0,
      child: Container(
        color: Color(0xfff48fb1),
        width: 90.0,
        height: 50.0,
      ),
    );
  }
}
