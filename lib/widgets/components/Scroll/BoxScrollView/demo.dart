/// @Author: 一凨 
/// @Date: 2018-12-17 13:16:29 
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-17 13:43:01

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BoxScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('滚动一下就看看吧 s(￣▽￣)~*'),
          Container(
            height: 300.0,
            child: ListViewDemo(
              children: <Widget>[
                BoxItem(),
                BoxItem(),
                BoxItem(),
                BoxItem(),
                BoxItem(),
                BoxItem(),
                BoxItem(),
                BoxItem(),
                BoxItem(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BoxItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      color: Theme.of(context).primaryColor,
      child: Text(
        '测试继承BoxScrollView',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ListViewDemo extends BoxScrollView {
  // 构造函数
  ListViewDemo({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    this.itemExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    List<Widget> children = const <Widget>[],
    int semanticChildCount,
  })  : childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount ?? children.length,
        );

  final double itemExtent;
  final SliverChildDelegate childrenDelegate;

// 子类应重写此方法以构建布局模型。
  @override
  Widget buildChildLayout(BuildContext context) {
    if (itemExtent != null) {
      return SliverFixedExtentList(
        delegate: childrenDelegate,
        itemExtent: itemExtent,
      );
    }
    return SliverList(delegate: childrenDelegate);
  }
}
