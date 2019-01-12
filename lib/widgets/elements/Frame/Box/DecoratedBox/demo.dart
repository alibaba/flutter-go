import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
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
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        //设置图片内容
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage('assets/images/food01.jpeg')),
        //外宽边框，可以不设置
        border: Border.all(
          color: Colors.blue.shade50,
          width: 10.0,
        ),
      ),
    );
  }
}

class DecoratedBoxCreateTwo extends StatelessWidget {
  DecoratedBoxCreateTwo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        //设置图片内容
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage('assets/images/food01.jpeg')),
        //根据传入的不同大小，呈现图片效弧度不同，
        borderRadius: BorderRadius.circular(90.0),
      ),
    );
  }
}

class DecoratedBoxCreateShape extends StatelessWidget {
  DecoratedBoxCreateShape({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage('assets/images/food01.jpeg')),
        border: Border.all(
          color: Colors.blue.shade50,
          width: 5.0,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
