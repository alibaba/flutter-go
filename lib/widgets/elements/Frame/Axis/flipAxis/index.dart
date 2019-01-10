import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Axis/flipAxis';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  Axis _direction ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _direction = Axis.horizontal;
  }

  Axis flipAxis() {
    assert(_direction != null);
    switch (_direction) {
      case Axis.horizontal:
        return Axis.vertical;
      case Axis.vertical:
        return Axis.horizontal;
    }
    return null;
  }

  _changeDirection(){
    setState(() {
          _direction=flipAxis();
        });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'flipAxis',
      child: Flex(
        direction: _direction,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          RaisedButton(
            child: Text('change direction'),
            onPressed: _changeDirection,
          )
        ],
      ),
      docUrl: 'https://docs.flutter.io/flutter/painting/flipAxis.html',
    );
  }
}
