 /// @Author: 一凨 
 /// @Date: 2018-11-28 20:52:35 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2018-11-28 20:59:50

import 'package:flutter/material.dart';

class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10.0),
      child:Table(
        columnWidths: const {
          0: FixedColumnWidth(50.0),
          1: FixedColumnWidth(100.0),
          2: FixedColumnWidth(50.0),
          3: FixedColumnWidth(100.0),
        },
        border: TableBorder.all(
            color: Colors.red, width: 1.0, style: BorderStyle.solid),
        children: const [
          TableRow(
            children: [
              Text('A1'),
              Text('B1'),
              Text('C1'),
              Text('D1'),
            ],
          ),
          TableRow(
            children: [
              Text('A2'),
              Text('B2'),
              Text('C2'),
              Text('D2'),
            ],
          ),
          TableRow(
            children: [
              Text('A3'),
              Text('B3'),
              Text('C3'),
              Text('D3'),
            ],
          ),
        ],
      ),
    );
  }
}