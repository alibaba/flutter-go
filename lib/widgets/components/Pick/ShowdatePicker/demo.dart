/// @Author: xiaojia.dxj
/// @Date: 2018-12-17 15:37:32
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-18 19:12:32

import 'dart:async';

import 'package:flutter/material.dart';

class ShowDatePickerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowDatePickerState();
}

class _ShowDatePickerState extends State<ShowDatePickerDemo> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

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

    if (picked == null) _date = DateTime.now();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time)
      print("data selectied :${_time.toString()}");
    setState(() {
      _time = picked;
    });
    if (picked == null) _time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('日期选择'),
        RaisedButton(
          child: Text('date selected:${_date.toString()}'),
          onPressed: () {
            _selectDate(context);
          },
        ),
        Text('时间选择'),
        RaisedButton(
          child: Text('date selected:${_time.toString()}'),
          onPressed: () {
            _selectTime(context);
          },
        )
      ],
    );
  }
}
