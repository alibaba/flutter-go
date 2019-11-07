/// @Author: xiaojia.dxj
/// @Date: 2018-12-18 11:40:57
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 16:50:43

import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  String dec = '点击回收';
  int count = 0;
  _modifty() {
    setState(() {
      dec = 'delete success: $count';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Chip(
            padding: EdgeInsets.only(
              right: 100.0,
            ),
            //标签前面的小widget
            avatar: CircleAvatar(
              backgroundColor: Colors.red.shade200,
              child: Text(
                'A',
                style: TextStyle(color: Colors.white),
              ),
            ),
            label: Text(
              'pai mai  ',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            backgroundColor: Colors.red.shade100,
            labelPadding: EdgeInsets.all(6.0),
          ),
        ),
        Container(
          height: 100.0,
          child: Chip(
            //头像
            avatar: CircleAvatar(
              child: Icon(
                Icons.account_circle,
                color: Colors.red.shade200,
              ),
              backgroundColor: Colors.white,
            ),
            //设置widget背景颜色
            backgroundColor: Colors.red.shade100,
            //剪辑窗口widget内容
            // antiAlias:剪辑具有抗锯齿功能，它比antiAliasWithSaveLayer快得多，但比hardEdge慢。
            //antiAliasWithSaveLayer:立即剪辑具有抗锯齿，并且可以分配屏幕外缓冲区，后续涂料都在该缓冲区完成，然后再进行修剪和合成
            clipBehavior: Clip.antiAlias,

            //设置padding值
            labelPadding: EdgeInsets.all(8.0),
            label: Text(dec),
            //设置onDeleted时候显示的图标
            deleteIcon: Icon(
              Icons.delete,
              color: Colors.white,
              size: 20.0,
            ),
            onDeleted: () {
              count++;
              _modifty();
            },
            deleteButtonTooltipMessage: '删除',
            deleteIconColor: Colors.blueGrey.shade100,
            //将最小点击目标大小扩展到48*48px
            materialTapTargetSize: MaterialTapTargetSize.padded,
            padding: EdgeInsets.all(2.0),
            //修改字体格式
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            // shape: _MyBorder(),
          ),
        )
      ],
    );
  }
}
