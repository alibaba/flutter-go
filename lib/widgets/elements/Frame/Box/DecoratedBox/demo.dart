/// Author: xiaojia.dxj
/// Date: 2018/11/22
/// Email: xiaojia.dxj@alibaba-inc.com
/// LastUpdateTime: 2018/11/22
/// LastUpdateBy: xj.deng

import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

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
        image: DecorationImage(
          ///fix:BoxFit.contain: 保持图片的比例，最大程度填充容器  BoxFit.fill:容器被图片完全填充，不在意图片比例，只填充整个容器
          ///fix:BoxFit.fitWidth：图片以宽被完全填充  BoxFit.fix:fixHigth:图片以高度完全填充
            fit: BoxFit.cover, //图片填充整个容器，按比例放大，多余部分被裁切
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
        image: DecorationImage(
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
        image: DecorationImage(
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

class DecoratedBoxCreateShapes extends StatelessWidget {
  DecoratedBoxCreateShapes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            //渐变效果  线性渐变
            colors: [Colors.red, Colors.yellowAccent, Colors.lightGreenAccent]),
//         color: const Color(0xff7c94b6),
        border: Border.all(
          color: Colors.blue.shade50,
          width: 5.0,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
