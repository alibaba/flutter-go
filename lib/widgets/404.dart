import 'package:flutter_web/material.dart';

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
