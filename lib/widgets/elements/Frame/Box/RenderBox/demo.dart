import 'package:flutter/material.dart';

class RenderBoxDemo extends StatefulWidget {
  _RenderBoxDemoState createState() => _RenderBoxDemoState();
}

class _RenderBoxDemoState extends State<RenderBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //  child: RenderFoo(),
        );
  }
}

class RenderFoo extends RenderBox {
  @override
  bool get hasSize => super.hasSize;

  @override
  BoxConstraints get constraints => super.constraints;
}
