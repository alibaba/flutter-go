import 'dart:async';

import 'package:flutter/material.dart';

import '../model/story.dart';

class HomeBanner extends StatefulWidget {
  final List<StoryModel> bannerStories;
  final OnTapBannerItem onTap;

  HomeBanner(this.bannerStories, this.onTap, {Key key})
      :super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BannerState();
  }
}

class _BannerState extends State<HomeBanner> {
  int virtualIndex = 0;
  int realIndex = 1;
  PageController controller;
  Timer timer;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: realIndex);
    timer = Timer.periodic(Duration(seconds: 5), (timer) { // 自动滚动
      /// print(realIndex);
      controller.animateToPage(realIndex + 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    timer.cancel();
  }

  /// pagination 的计数器
  Widget _numberIndicator(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text("${++index}/$itemCount",
          style: TextStyle( color: Colors.white70, fontSize: 12.0, fontWeight:FontWeight.bold )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226.0,
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView(
              controller: controller,
              onPageChanged: _onPageChanged,
              children: _buildItems(),),
            _buildIndicator(), // 下面的小点
            Positioned(//方法二
                top: 0.0,
                right: 0.0,
                child: _numberIndicator(context,virtualIndex,widget.bannerStories.length),
            )
          ]),
    );
  }

  List<Widget> _buildItems() { // 排列轮播数组
    List<Widget> items = [];
    if (widget.bannerStories.length > 0) {
      // 头部添加一个尾部Item，模拟循环
      items.add(
          _buildItem(widget.bannerStories[widget.bannerStories.length - 1]));
      // 正常添加Item
      items.addAll(
          widget.bannerStories.map((story) => _buildItem(story)).toList(
              growable: false));
      // 尾部
      items.add(
          _buildItem(widget.bannerStories[0]));
    }
    return items;
  }

  Widget _buildItem(StoryModel story) {
    return GestureDetector(
      onTap: () { // 按下
        if (widget.onTap != null) {
          widget.onTap(story);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         Image.network(story.image, fit: BoxFit.cover),
          _buildItemTitle(story.title), // 内容文字,大意
        ],),);
  }

  Widget _buildItemTitle(String title) {
    return Container(
      decoration: BoxDecoration( /// 背景的渐变色
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: const Alignment(0.0, -0.8),
          colors: [const Color(0xa0000000), Colors.transparent],
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
        child: Text(
          title, style: TextStyle(color: Colors.white, fontSize: 18.0),),),
    );
  }

  Widget _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.bannerStories.length; i++) {
      indicators.add(Container(
          width: 6.0,
          height: 6.0,
          margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == virtualIndex ? Colors.white : Colors.grey)));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators);
  }

  _onPageChanged(int index) {
    realIndex = index;
    int count = widget.bannerStories.length;
    if (index == 0) {
      virtualIndex = count - 1;
      controller.jumpToPage(count);
    } else if (index == count + 1) {
      virtualIndex = 0;
      controller.jumpToPage(1);
    } else {
      virtualIndex = index - 1;
    }
    setState(() {});
  }
}

typedef void OnTapBannerItem(StoryModel story);