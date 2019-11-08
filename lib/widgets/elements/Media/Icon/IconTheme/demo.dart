/// Author: xiaojia.dxj
/// Date: 2018-12-15 16:07:59
/// Email: xiaojia.dxj@alibaba-inc.com
/// Last Modified by: xiaojia.dxj
/// Last Modified time: 2018-12-15 16:49:17
import 'package:flutter/material.dart';

class IconThemeDemo extends StatelessWidget {
  final Color curColor;

  IconThemeDemo({Key key, this.curColor}) : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconTheme(
          data: IconThemeData(color: curColor, opacity: 3.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Icon(Icons.equalizer),
          ),
        ),
      ],
    );
  }
}

class IconThemeDemo2 extends StatelessWidget {
  final Color curColor;
  final double curSize;

  IconThemeDemo2({Key key, this.curColor, this.curSize}) : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconTheme(
            data: IconThemeData(color: curColor, opacity: 3.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  size: curSize,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('喜欢'),
                ),
              ],
            )),
      ],
    );
  }
}
