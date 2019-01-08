/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-17 15:37:32 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-21 11:26:21
 */
import 'dart:async';

import 'package:flutter/material.dart';

class MothPickerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _first();
}

class _first extends State<MothPickerDemo> {
  DateTime _date = new DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date)
      print("data selectied :${_date.toString()}");
    setState(() {
      _date = picked;
    });

    if (picked == null) _date = new DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text('日期选择'),
        new RaisedButton(
          child: new Text('date selected:${_date.toString()}'),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ],
    );
  }
}
