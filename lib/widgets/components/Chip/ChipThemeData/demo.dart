/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-18 15:14:10 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-18 19:39:41
 */
import 'package:flutter/material.dart';

class ChipThemeDemo extends StatefulWidget {
  _ChipThemeDemoState createState() => _ChipThemeDemoState();
}

class _ChipThemeDemoState extends State<ChipThemeDemo> {
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return ChipTheme(
      data: ChipThemeData.fromDefaults(
        // brightness: Brightness.dark,
      labelStyle: TextStyle(fontSize: 15.0), 
      primaryColor: Colors.red,secondaryColor: Colors.red.shade800),
      child: ChoiceChip(
        padding: EdgeInsets.only(left: 100.0,right: 100.0,top: 10.0,bottom: 10.0),
        label: Text('down'),
        onSelected: (bool value) {
          setState(() {
            _color = value ? Colors.black : Colors.red;
          });
        },
        selected: _color == Colors.black,
      ),
    );
  }
}


  
