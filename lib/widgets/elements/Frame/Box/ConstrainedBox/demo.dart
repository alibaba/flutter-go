  /// Author: xiaojia.dxj
 /// Date: 2018/11/22
 /// Email: xiaojia.dxj@alibaba-inc.com
 /// LastUpdateTime: 2018/11/22
 /// LastUpdateBy: xj.deng
 /// Describle:ConstrainedBox描述

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConstrainedBoxCreate extends StatelessWidget {
  final double currWidth;
  final String describe;

  const ConstrainedBoxCreate({Key key,this.currWidth,this.describe}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          //制定一个指定大小的盒子，限定最大最小宽高
          constraints: const BoxConstraints(
            minWidth: 100.0,
            minHeight: 20.0,
            maxWidth: 300.0,
            maxHeight: 50.0,
          ),
          child:  Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            //child 宽高超过制定限制范围失效，效果宽/高=100/20区域
            width: currWidth,
            height: 250.0,
            child:  Text(
              describe,
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xfff8bbd0),
          ),
        ),
      ],
    );
  }
}
