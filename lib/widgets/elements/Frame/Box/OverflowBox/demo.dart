import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OverflowBoxDefault extends StatelessWidget {
  double curmaxHeight;
  double curmaxWidth;
  double curHeight;
  double curWidth;
  AlignmentGeometry curalignment;

  OverflowBoxDefault(
      {Key key,
      double this.curmaxHeight,
      double this.curmaxWidth,
      double this.curWidth,
      double this.curHeight,
      AlignmentGeometry this.curalignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: 50.0,
      minWidth: 50.0,
      //设置最大宽，高
      maxWidth: curmaxWidth,
      maxHeight: curmaxHeight,
      /**
       * 调整child位置
       */
      alignment: curalignment,
      child: Container(
        /**
         * widget宽高大于overflowBox设置的最大，以overflowbox设置的最大宽高为限制，
         * 小于overflowBox  设置的最大限度，子widget能够完全显示
         * * */
        height: curHeight,
        width: curWidth,
        color: Colors.red,
      ),
    );
  }
}
