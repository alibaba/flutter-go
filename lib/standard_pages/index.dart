//
// Created with Android Studio.
// User: 三帆
// Date: 25/05/2019
// Time: 21:23
// email: sanfan.hx@alibaba-inc.com
// target: 该文件用在打包后的代码中.日常开发的时候, 获取markdown不走该目录
//
import 'package:flutter/material.dart';
import 'page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4/index.dart' as page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4;


class StandardPages {
  Map<String, String> standardPages;
  Map<String, String> getPages() {
    return {
      'page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4': page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4.stringMd
    };
  }
}