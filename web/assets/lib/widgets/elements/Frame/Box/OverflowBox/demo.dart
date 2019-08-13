import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class OverflowBoxDefault extends StatelessWidget {
  final double curmaxHeight;
  final double curmaxWidth;
  final double curHeight;
  final double curWidth;
  final AlignmentGeometry curalignment;

  OverflowBoxDefault(
      {Key key,
      this.curmaxHeight,
      this.curmaxWidth,
      this.curWidth,
      this.curHeight,
      this.curalignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: 80.0,
      minWidth: 80.0,
      //设置最大宽，高
      maxWidth: curmaxWidth,
      maxHeight: curmaxHeight,

      //调整child位置
      alignment: curalignment,
      child: Container(
        //widget宽高大于overflowBox设置的最大，以overflowbox设置的最大宽高为限制，
        //小于overflowBox  设置的最大限度，子widget能够完全显示
        height: curHeight,
        width: curWidth,
        child: Text(
          "$curmaxWidth * $curmaxHeight",
          style: TextStyle(color: Colors.white),
        ),
        color: Color(0xfff48fb1),
      ),
    );
  }
}
