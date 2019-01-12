/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午10:00
 * email: zhu.yan@alibaba-inc.com
 * tartget: BottomNavigationBarItem 的示例
 */

import 'package:flutter/material.dart';

/*
* Checkbox 默认按钮的实例
* index 当前checkbox 的索引值
* */
class BottomNavigationBarItemFullDefault extends StatefulWidget {
  const BottomNavigationBarItemFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarItemFullDefault();
}



/*
* BottomNavigationBarItem 默认的实例,无状态
* */
class BottomNavigationBarItemLessDefault extends StatelessWidget {
  final widget;
  final parent;

  const BottomNavigationBarItemLessDefault([this.widget, this.parent])
      : super();

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        height: 100,
        child: Scaffold(
          bottomNavigationBar: new BottomNavigationBar(items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.laptop_chromebook),
                title: new Text("主页"),
                backgroundColor: Colors.red
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.list), title: new Text("分类"),backgroundColor: Colors.grey),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.local_grocery_store), title: new Text("购物车")),
            new BottomNavigationBarItem(icon: new Icon(Icons.person), title: new Text("我的"))
          ],
            //onTap: onTap,
            //currentIndex: page
          ),
        )
    );
  }
}

//backgroundColor: Colors.grey,
//
////      body: new PageView(
////
////          children: [
////            new Index(),
////            new Classify(),
////            new Shopping(),
////            new Myself()
////          ],
////
////          controller: pageController,
////          onPageChanged: onPageChanged
////      ),
//
