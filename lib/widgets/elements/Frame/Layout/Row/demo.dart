import 'package:flutter_web/material.dart';
/// Author: xiaojia.dxj
 /// Date: 2018/11/22
 /// Email: xiaojia.dxj@alibaba-inc.com
 /// LastUpdateTime: 2018/11/22
 /// LastUpdateBy: xj.deng
 /// Describle:Row

import 'package:flutter_web/widgets.dart';
 
class RowMainAxisAlignment extends StatelessWidget {
  //> mainAxisAlignment属性
  // - MainAxisAlignment.spaceEvenly/spaceAround/spaceBetween,
  //  - spaceEvenly：将主轴方向空白区域均分，使得children之间空间相等，包括首尾childre
  //  - spaceAround：将主轴方向空白区域均分，使得children之间空间相等，但是首尾childre的空白部分为一半
  //  - spaceBetween：将主轴方向空白区域均分，使得children之间空间相等，但是首尾childre靠近收尾，没有空细逢
  //  - MainAxisAlignment.start/end/center,
  //  - start：将children放置在主轴起点方向
  //  - end：将children放置在主轴末尾方向
  //  - center：将children放置在主轴中间方向

  final MainAxisAlignment status;

  // > CrossAxisAlignment 属性
  //   -  crossAxisAlignment: CrossAxisAlignment.center/end/start,
  //   - 即，根据设定的位置交叉对齐
  //   - center/end/start: children在交叉轴上居中/末端/起点 对齐展示
  //   - stretch：让children填满交叉轴方向
  //   - baseline：在交叉轴方向，使得于这个baseline对齐，如果主轴是垂直的，那么这个值是当作开始

  final CrossAxisAlignment crossStatus;

  const RowMainAxisAlignment(this.status, this.crossStatus) : super();

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: status,
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
      ],
    );
  }
}

class RowLayoutCreate extends StatelessWidget {
  const RowLayoutCreate() : super();

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin:  EdgeInsets.only(top: 20.0, bottom: 20.0),
          color: Color(0xfffce4ec),
          width: 60.0,
          height: 50.0,
        ),
        Container(
          margin:  EdgeInsets.only(top: 20.0, bottom: 20.0),
          color: Color(0xfff8bbd0),
          width: 60.0,
          height: 50.0,
        ),
        Container(
          margin:  EdgeInsets.only(top: 20.0, bottom: 20.0),
          color: Color(0xfff48fb1),
          width: 60.0,
          height: 50.0,
        ),
        Container(
          margin:  EdgeInsets.only(top: 20.0, bottom: 20.0),
          color: Color(0xfff06292),
          width: 60.0,
          height: 50.0,
        ),
      ],
    );
  }
}

class RowExpanded extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        ////填充数据
        Expanded(child: new RaisedButton(
            onPressed: (){
            },
            color: Color(0xfffce4ec),
            child:new Text('flutter',style: TextStyle(color: Colors.white),)
        ),),
        Expanded(child: new RaisedButton(
            onPressed: (){
            },
            color: Color(0xfff8bbd0),
            child:new Text('Expanded',style: TextStyle(color: Colors.white),)
        ),),
        Expanded(child: new RaisedButton(
            onPressed: (){
            },
            color: Color(0xfff48fb1),
            child:new Text('flutter',style: TextStyle(color: Colors.white),)
        ),),
      ],
    );
  }

}
