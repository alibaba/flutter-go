import 'package:flutter_web/widgets.dart';
import 'package:flutter_web/material.dart';

class LimitedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Color(0xfff8bbd0),
          child: Text(
            "100 * 100",
            style: TextStyle(color: Colors.white),
          ),
        ),
        LimitedBox(
          maxWidth: 100,
          maxHeight: 100,
          child: Container(
            width: 250,
            height: 300,
            child: Text(
              "250 * 300",
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xfff48fb1),
          ),
        )
      ],
    );
  }
}

class LimitedBoxColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          child: Text("Column 列表下效果"),
        ),
        Container(
          width: 100,
          height: 100,
          color: Color(0xfff8bbd0),
          child: Text(
            "100 * 100",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 10.0),
        LimitedBox(
          maxWidth: 100,
          maxHeight: 100,
          child: Container(
            width: 250,
            height: 300,
            child: Text(
              "250 * 300",
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xfff48fb1),
          ),
        )
      ],
    );
  }
}
