import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * Author: xiaojia.dxj
 * Date: 2018/11/22
 * Email: xiaojia.dxj@alibaba-inc.com
 * LastUpdateTime: 2018/11/22
 * LastUpdateBy: xj.deng
 *
 */
class DecoratedBoxCreate extends StatelessWidget {
  DecoratedBoxCreate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.5, -0.6),
          radius: 0.15,
          colors: <Color>[const Color(0xFFEEEEEE), Colors.pink.shade600],
          stops: <double>[0.9, 1.0],
        ),
      ),
    );
  }
}
