import 'package:flutter/material.dart';

class UnconstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      textDirection: TextDirection.rtl,
      child: new Row(
        children: <Widget>[
          Container(
            width: 200.0,
            height: 200.0,
            color: Colors.red,
          ),
        ],
      ),
//          child: Text(
//              'This allows a child to render at the size it would render '
//              'if it were alone on an infinite canvas with no constraints. '
//              'This container will then attempt to adopt the same size, within'
//              ' the limits of its own constraints. If it ends up with a different size, '
//              'it will align the child based on alignment. If the box cannot expand enough '
//              'to accommodate the entire child, the child will be clipped'),
    );
  }
}
