/// @Author: 一凨 
/// @Date: 2018-12-27 14:05:32 
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-27 14:05:52

import 'package:flutter/material.dart';

class DropdownMenuItemDemo extends StatefulWidget {
  _DropdownMenuItemDemoState createState() => _DropdownMenuItemDemoState();
}

class _DropdownMenuItemDemoState extends State<DropdownMenuItemDemo> {

    String dropdown1Value = 'Free';
  String dropdown2Value;
  String dropdown3Value = 'Four';

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: const Text('Simple dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown1Value,
              onChanged: (String newValue) {
                setState(() {
                  dropdown1Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListTile(
            title: const Text('Dropdown with a hint:'),
            trailing: DropdownButton<String>(
              value: dropdown2Value,
              hint: const Text('Choose'),
              onChanged: (String newValue) {
                setState(() {
                  dropdown2Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListTile(
            title: const Text('Scrollable dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown3Value,
              onChanged: (String newValue) {
                setState(() {
                  dropdown3Value = newValue;
                });
              },
              items: <String>[
                  'One', 'Two', 'Free', 'Four', 'Can', 'I', 'Have', 'A', 'Little',
                  'Bit', 'More', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'
                 ]
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
             ),
          ),
        ],
      ),
    );
  }
}