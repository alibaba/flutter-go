/// @Author: xiaojia.dxj
/// @Date: 2018-12-18 15:14:10 
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-18 19:15:25

import 'package:flutter/material.dart';

class ChipThemeDemo extends StatefulWidget {
  _ChipThemeDemoState createState() => _ChipThemeDemoState();
}

class _ChipThemeDemoState extends State<ChipThemeDemo> {
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return ChipTheme(
      data: ChipTheme.of(context).copyWith(backgroundColor:Colors.red.shade800 ),
      child: ChoiceChip(
        padding: EdgeInsets.only(left: 100.0,right: 100.0,top: 10.0,bottom: 10.0),
        label: Text('down'),
        labelStyle: TextStyle(color: Colors.white),
        onSelected: (bool value) {
          setState(() {
            _color = value ? Colors.lightBlue : Colors.red;
          });
        },
        selected: _color == Colors.lightBlue,
      ),
    );
  }
}

  // Widget build(BuildContext context) {
  
  //   return Container(
  //     child: ChipTheme(
  //       data: ChipThemeData(
  //         backgroundColor: Colors.red.shade500,
  //         //描述颜色对比度（暗，亮，设置固定值）
  //         brightness : Brightness.dark,
  //         deleteIconColor: Colors.red.shade200,
  //         //背景颜色，表示它被禁用
  //         disabledColor: Colors.grey.shade50,
  //         labelPadding: EdgeInsets.all(10.0),
  //         labelStyle: TextStyle(fontSize: 15.0,fontStyle: FontStyle.italic),
  //         padding: EdgeInsets.all(2.0),
  //         //用于另一种chip widget 标签样式
  //         secondaryLabelStyle: TextStyle(fontSize: 20.0,fontStyle: FontStyle.normal),
  //         selectedColor: Colors.yellow,
  //         //表示已经选中度颜色
  //         secondarySelectedColor: Colors.black
  //         // shape: 
  //       ),
  //     ),
  //   );

    
  // }
