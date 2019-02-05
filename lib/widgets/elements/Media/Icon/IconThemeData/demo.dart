/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-17 09:46:31 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-17 15:53:42
 */

import 'package:flutter/material.dart';

class IconThemeDemo extends StatelessWidget {
  final Color curColor;
  final double curOpacity;

  IconThemeDemo({Key key, this.curColor, this.curOpacity}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  IconTheme(
        //opacity: 设置透明
        data:  IconThemeData(
          color: curColor,
          opacity: curOpacity,
        ),
        child:  Icon(Icons.favorite),
      ),
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
            data:  IconThemeData(color: curColor, opacity: 1.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.favorite_border),
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
