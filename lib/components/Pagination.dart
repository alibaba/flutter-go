// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './homeBanner.dart';
import '../model/story.dart';


class Pagination extends StatelessWidget {
  static const String routeName = '/material/page-selector';
  static final List<Icon> icons = <Icon>[
    const Icon(Icons.event, semanticLabel: 'Event'),
    const Icon(Icons.home, semanticLabel: 'Home'),
    const Icon(Icons.android, semanticLabel: 'Android'),
    const Icon(Icons.alarm, semanticLabel: 'Alarm'),
    const Icon(Icons.face, semanticLabel: 'Face'),
    const Icon(Icons.language, semanticLabel: 'Language'),
  ];

  List<StoryModel> bannerStories = [];

  List<dynamic> arr = [
    {'image': 'https://pic2.zhimg.com/v2-6733af287e1220a041fc8dcef6be9dc9.jpg', 'type': 0, 'id': 9695909, 'ga_prefix': 091507, 'title': '从一个摄影师的角度，我来谈谈这一代 iPhone 是如何继续'},
    {'image': 'https://pic1.zhimg.com/v2-c9a673ff89e5cc4c31ffcdf0c2d2f364.jpg', 'type': 0, 'id': 9695859, 'ga_prefix': 091517, 'title': '怪不得他能拿诺贝尔文学奖，一个月就能写出一部了不起的长篇小说'},
    {'image': 'https://pic3.zhimg.com/v2-cf89ac60dbe59ab3ca908ff4bbf843e6.jpg', 'type': 0, 'id': 96956491409, 'title': '「死者被碎尸，警方排除他杀」，这并不荒唐'},
    {'image': 'https://pic4.zhimg.com/v2-e21659cb7bc4ab43599772fa552e6e8b.jpg', 'type': 0, 'id': 9695816, 'ga_prefix': 091312, 'title': 'iPhone 5c、SE 接连失利之后，这次苹果还是「没长记性」'}
  ];


//  @override
//  void initState() { // 无状态widget 不会调用
//    print('start');
//    /// super.initState();
//    arr.forEach((item) {
//      bannerStories.add(StoryModel.fromJson(item));
//    });
//
//  }


  List<Widget> _PageSelector(BuildContext context) {
    List<Widget> list = [];
    print('start');
    /// super.initState();
    arr.forEach((item) {
      bannerStories.add(StoryModel.fromJson(item));
    });


    if (icons.length > 0) {
      list.add(HomeBanner(bannerStories, (story) {
        /// _openStoryDetailPage(story);
      }));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        //physics: AlwaysScrollableScrollPhysics(),
        //padding: EdgeInsets.only(),
        children: _PageSelector(context)
      );
  }
}
