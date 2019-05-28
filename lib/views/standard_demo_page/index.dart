//
// Created with Android Studio.
// User: 三帆
// Date: 25/05/2019
// Time: 21:46
// email: sanfan.hx@alibaba-inc.com
// tartget:  xxx
//

import 'package:flutter/material.dart';
import '../../components/widget_demo.dart';

class StandardView extends StatefulWidget {
  final String id;
  final String detailMd;
  StandardView({this.id, this.detailMd});
  @override
  _StandardView createState() => _StandardView();
}

class _StandardView extends State<StandardView> {
  String markdownDesc = '# this is header';
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: '标准page',
      codeUrl: 'elements/Form/Button/DropdownButton/demo.dart',
      contentList: [
        Text(markdownDesc)
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/DropdownButton-class.html',
    );
  }
}