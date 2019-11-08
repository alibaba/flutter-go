/// Author: xiaojia.dxj
/// Date: 2018/12/2
/// Email: xiaojia.dxj@alibaba-inc.com
/// LastUpdateTime: 2018/12/2
/// LastUpdateBy: xj.deng
/// Describle:FittedBox

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FittedBoxDefault extends StatelessWidget {
  final BoxFit curfit;
  final String dec;

  FittedBoxDefault({Key key, this.curfit, this.dec});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //外部有位置约束，内部大小设定失效，保持和外部约束一致
          height: 100.0,
          width: 100.0,
          color: Color(0xfff8bbd0),
          child: FittedBox(
            fit: curfit,
            // 修改child写入布局时期分配的空间
            alignment: Alignment.center,
            //alignment修改child于父空间对齐方式，默认：Alignment.center,
            child: Container(
              color: Color(0xfff48fb1),
              child: Text(
                'fittedBox',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Text(dec),
      ],
    );
  }
}
