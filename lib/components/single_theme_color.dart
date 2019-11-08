import 'package:flutter/material.dart';
import 'package:flutter_go/event/event_bus.dart';
import 'package:flutter_go/event/event_model.dart';
// import 'package:event_bus/event_bus.dart';

class SingleThemeColor extends StatelessWidget {
  final int themeColor;
  final String coloeName;

  const SingleThemeColor({Key key, this.themeColor, this.coloeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (ApplicationEvent.event != null) {
          print('fire ${this.themeColor}');
          ApplicationEvent.event
              .fire(UserSettingThemeColorEvent(this.themeColor));
          Navigator.of(context).pop();
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              color: Color(this.themeColor),
            ),
          ),
          Text(
            this.coloeName,
            style: TextStyle(
              color: Color(this.themeColor),
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}
