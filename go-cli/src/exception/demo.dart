//
// Created with Android Studio.
// User: 三帆
// Date: 25/05/2019
// Time: 21:20
// email: sanfan.hx@alibaba-inc.com
// target:  xxx
//


import 'package:console/console.dart';

class InvalidDemo implements Exception {
  final String details;
  InvalidDemo(this.details);

  @override
  String toString() {
    return format('{color.red}Invalid demo happends:  $details {color.normal}');
  }
}