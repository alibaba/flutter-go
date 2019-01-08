import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeOverflowBoxDefault extends StatelessWidget {
  final double curSizeWidth;
  final double curSizeHeight;
  final String text;

  SizeOverflowBoxDefault(
      {Key key,
      double this.curSizeWidth,
      double this.curSizeHeight,
      String this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedOverflowBox(
      size: Size(curSizeWidth, curSizeHeight),
      alignment: Alignment.centerRight,
      //size属性设置了大小，container 里面的大小失效,
      child: Container(
        color: Color(0xfff06292),
        width: 50.0,
        height: 50.0,
        child: new Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SizeBoxDefault extends StatelessWidget {
  final double curWidth;
  final double curHeight;

  SizeBoxDefault({Key key, double this.curHeight, double this.curWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: curWidth,
      height: curHeight,
      child: const Card(
        child: Text(
          'SizedBox',
          style: TextStyle(color: Colors.white),
          textDirection: TextDirection.rtl,
        ),
        color: Color(0xfff06292),
      ),
    );
  }
}
