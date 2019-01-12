import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Axis/crossAxis';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'crossAxis',
      contentList: [Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10.0),
          ),
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10.0),
          ),
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10.0),
          ),
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(10.0),
          ),
        ],
      )],
      docUrl: 'https://docs.flutter.io/flutter/widgets/Padding-class.html',
    );
  }
}
