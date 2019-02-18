/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午10:38
/// email: zhu.yan@alibaba-inc.com
/// target: FlexibleSpaceBar 的示例

import 'package:flutter/material.dart';

/*
* Checkbox 默认FlexibleSpaceBar的实例
* */
class FlexibleSpaceBarFullDefault extends StatefulWidget {
  const FlexibleSpaceBarFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _FlexibleSpaceBarFullDefault();
}

/*
* FlexibleSpaceBar 默认的实例,有状态
* */
class _FlexibleSpaceBarFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      // ...  // 如果没有,就是不需要有状态的 StatefulWidget
    );
  }
}

/*
* FlexibleSpaceBar 默认的实例,无状态
* */
class FlexibleSpaceBarLessDefault extends StatelessWidget {
  final widget;
  final parent;

  const FlexibleSpaceBarLessDefault([this.widget, this.parent])
      : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300.0,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 150.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Collapsing Toolbar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        fit: BoxFit.cover,
                      )),
                ),
              ];
            },
            body: Center(
              child: Text("向上提拉 ⬆ 查看效果..."),
            ),
          ),
        )
    );
}}