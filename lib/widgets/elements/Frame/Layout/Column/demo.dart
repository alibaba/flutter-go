import 'package:flutter/widgets.dart';

/**
 * Author: xiaojia.dxj
 * Date: 2018/11/22
 * Email: xiaojia.dxj@alibaba-inc.com
 * LastUpdateTime: 2018/11/22
 * LastUpdateBy: xj.deng
 *
 * Describle:Colum describe
 */
class ColumnDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      /**
       * - MainAxisAlignment.spaceEvenly/spaceAround/spaceBetween,
          - spaceEvenly：将主轴方向空白区域均分，使得children之间空间相等，包括首尾childre
          - spaceAround：将主轴方向空白区域均分，使得children之间空间相等，但是首尾childre的空白部分为一半
          - spaceBetween：将主轴方向空白区域均分，使得children之间空间相等，但是首尾childre靠近收尾，没有空细逢

          - MainAxisAlignment.start/end/center,
          - start：将children放置在主轴起点方向
          - end：将children放置在主轴末尾方向
          - center：将children放置在主轴中间方向
       */
      mainAxisAlignment: MainAxisAlignment.center,
      /**
       * > mainAxisSize 属性
          - 一行的高度是有mainAxisSize属性控制，默认是max
          - mainAxisSize: MainAxisSize.min,一行的宽度是child传入的约束
          - mainAxisSize: MainAxisSize.max,一行的宽度的最大宽度是传入的约束。
          > mainAxisAlignment属性
       */
      mainAxisSize: MainAxisSize.max,
      /**
       * -  crossAxisAlignment: CrossAxisAlignment.center/end/start,
          - 即，根据设定的位置交叉对齐
          - center/end/start: children在交叉轴上居中/末端/起点 对齐展示
          - stretch：让children填满交叉轴方向
          - baseline：在交叉轴方向，使得于这个baseline对齐，如果主轴是垂直的，那么这个值是当作开始
       */
      children: <Widget>[
        Container(
          color: Color(0xfffce4ec),
          width: 90.0,
          height: 50.0,
        ),
        Container(
          color: Color(0xfff8bbd0),
          width: 90.0,
          height: 50.0,
        ),
        Container(
          color: Color(0xfff48fb1),
          width: 90.0,
          height: 50.0,
        ),
        Container(
          color: Color(0xfff06292),
          width: 90.0,
          height: 50.0,
        ),
        Text('We move under cover and we move as one'),
        Text('Through the night, we have one shot to live another day'),
        Text('We cannot let a stray gunshot give us away'),
        Text('We will fight up close, seize the moment and stay in it'),
        Text('It’s either that or meet the business end of a bayonet'),
        Text('The code word is ‘Rochambeau,’ dig me?'),
        Text('Rochambeau!',
            style:
                DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.0)),
      ],
    );
  }
}
