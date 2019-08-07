 /// Created with Android Studio.
 /// User: 三帆
 /// Date: 20/12/2018
 /// Time: 14:32
 /// email: sanfan.hx@alibaba-inc.com
 /// target:  xxx

import 'package:flutter/material.dart';


class DemoA extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<DemoA> {
  String value = '';

  onChange(v) {
    this.setState(() {
      value = v;
    });
  }
  Widget build(BuildContext context) {

    return  Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('A'),
          value: "A",
          groupValue: this.value,
          isThreeLine: false,
          subtitle: const Text("subtitleA"),
          onChanged:onChange
        ),
        RadioListTile<String>(
          title: const Text('B'),
          value: "B",
            subtitle: const Text("subtitleB"),
          groupValue: this.value,
          onChanged: onChange
        ),
      ],
    );
  }
}
