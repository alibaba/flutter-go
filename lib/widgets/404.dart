import 'package:flutter/material.dart';

class WidgetNotFound extends StatelessWidget {

    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("widget not found"),
          ),
          body: Container(
              child:  Text("widget not found")
          )
      );
    }
}
