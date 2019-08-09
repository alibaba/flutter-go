//
// Created with Android Studio.
// User: 三帆
// Date: 30/07/2019
// Time: 16:51
// email: sanfan.hx@alibaba-inc.com
// target:  build
//


import 'package:args/command_runner.dart';
import '../build/build_demo_list.dart';
import '../build/build_page_list.dart';


import 'dart:async';


class Build extends Command<int> {
  @override
  final name = 'build';
  @override
  final description = '生成索引等';


  @override
  Future<int> run() async {
    buildPageListJson();
    buildDemoListJson();
    return 0;
  }
}