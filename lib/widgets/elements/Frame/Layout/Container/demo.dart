import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
 * Author: xiaojia.dxj
 * Date: 2018/11/22
 * Email: xiaojia.dxj@alibaba-inc.com
 * LastUpdateTime: 2018/11/22
 * LastUpdateBy: xj.deng
 *
 * Describle:Colum describe
 */
class ContainerDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: const Color(0xfff48fb1),
            width: 160.0,
            height: 160.0,
          ),
        )
      ],
    );
  }
}

class ContainerDefaultA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 30.0,
          height: 30.0,
          child: Container(
            width: 60.0,
            height: 60.0,
            color: const Color(0xfff48fb1),
          ),
        ),
      ],
    );
  }
}

class ContainerDefaultB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
      ),
      padding: const EdgeInsets.all(8.0),
      color: Colors.teal.shade700,
      alignment: Alignment.center,
      child: Text('Hello World',
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.white)),
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://www.example.com/images/frame.png'),
          centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      ),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}
