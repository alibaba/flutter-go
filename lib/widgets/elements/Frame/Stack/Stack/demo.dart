 /// Author: xiaojia.dxj
 /// Date: 2018/11/22
 /// Email: xiaojia.dxj@alibaba-inc.com
 /// LastUpdateTime: 2018/11/22
 /// LastUpdateBy: xj.deng
 /// Describle:stack描述
 
import 'package:flutter/material.dart';

class StackDefault extends StatelessWidget {
  const StackDefault() : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Stack(
          //fit :定义如何设置non-positioned节点尺寸
          fit: StackFit.loose,
          overflow: Overflow.clip,
          textDirection: TextDirection.ltr,
          alignment: Alignment.center,
          children: [
             Container(
              color:  Color(0xfff48fb1),
              width: 100.0,
              height: 50.0,
            ),
             Text("stack demo",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                    color: Colors.white)),
          ],
        ),
      ],
    );
  }
}

class StackDefault2 extends StatelessWidget {
  const StackDefault2() : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Stack(
          //fit :定义如何设置non-positioned节点尺寸
          fit: StackFit.loose,
          overflow: Overflow.clip,
          textDirection: TextDirection.ltr,
          alignment: Alignment.center,
          children: [
             Text("stack demo",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                    color: Colors.white)),
             Container(
              color:  Color(0xfff48fb1),
              width: 100.0,
              height: 50.0,
            ),
          ],
        ),
      ],
    );
  }
}

class StackPositioned extends StatelessWidget {
  const StackPositioned() : super();

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: <Widget>[
         Positioned(
            child:  Icon(
          Icons.monetization_on,
          size: 40.0,
          color: Colors.yellow[300],
        )),
         Positioned(
            left: 40.0,
            child:  Icon(
              Icons.monetization_on,
              size: 40.0,
              color: Colors.yellow[600],
            )),
         Positioned(
            left: 60.0,
            child:  Icon(
              Icons.monetization_on,
              size: 40.0,
              color: Colors.yellow[600],
            )),
         Positioned(
            left: 80.0,
            child:  Icon(
              Icons.monetization_on,
              size: 40.0,
              color: Colors.yellow[600],
            )),
      ],
    );
  }
}

class StackLayout extends StatelessWidget {
  const StackLayout() : super();

  @override
  Widget build(BuildContext context) {
    return  Stack(
      overflow: Overflow.visible,
      alignment: const Alignment(0.2, 0.6),
      children: <Widget>[
        CircleAvatar(
          backgroundColor:  Color(0xfff48fb1),
          radius: 140.0,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black45),
          child: Text(
            'Min',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}
