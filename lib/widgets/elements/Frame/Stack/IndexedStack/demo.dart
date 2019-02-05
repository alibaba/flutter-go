import 'package:flutter/material.dart';

/*
 * Author: xiaojia.dxj
 * Date: 2018/11/22
 * Email: xiaojia.dxj@alibaba-inc.com
 * LastUpdateTime: 2018/11/22
 * LastUpdateBy: xj.deng
 *
 * Describle:indexedStack
 */
class StackDefault extends StatelessWidget {
  final int currIndex;

  const StackDefault(this.currIndex) : super();

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currIndex,
      children: [
//        CircleAvatar(
//          backgroundImage: AssetImage('images/timg.jpeg'),
//          radius: 100.0,
//        ),
//         Image.asset(
//          'images/timg.jpeg',
//          width: 600.0,
//          height: 240.0,
//          fit: BoxFit.cover,
//        ),
        CircleAvatar(
          backgroundColor:  Color(0xfff48fb1),
          radius: 40.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'IndexedStack',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class StackIndex extends StatelessWidget {
  final int currIndex;

  const StackIndex(this.currIndex) : super();

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currIndex,
      children: [
         Icon(
          Icons.update,
          size: 40.0,
          color: Color(0xffe91e63),
        ),
         Icon(
          Icons.access_alarm,
          size: 40.0,
          color: Color(0xffe91e63),
        ),
         Icon(
          Icons.add_alarm,
          size: 40.0,
          color: Color(0xffe91e63),
        ),
         Icon(
          Icons.access_time,
          size: 40.0,
          color: Color(0xffe91e63),
        ),
         Icon(
          Icons.alarm_off,
          size: 40.0,
          color: Color(0xffe91e63),
        ),
      ],
    );
  }
}
